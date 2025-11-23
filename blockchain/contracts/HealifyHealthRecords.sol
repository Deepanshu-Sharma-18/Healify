// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title HealifyHealthRecords
 * @author Healify Team
 */

contract HealifyHealthRecords {
    
    // ==============================s==============
    // CONSTANTS
    // ============================================
    
    uint256 public constant MAX_RECORDS_PER_PAGE = 50;
    uint256 public constant VERSION = 1;
    
    // ============================================
    // ENUMS
    // ============================================
    
    enum RecordType {
        PROFILE,
        ALLERGY_HISTORY,
        FAMILY_HISTORY,
        VITALS,
        MEDICAL_RECORD,
        CUSTOM
    }
    
    // ============================================
    // STRUCTS
    // ============================================
    
    /**
     * @dev Main health record structure
     */
    struct HealthRecord {
        bytes32 dataCIDHash;        
        address owner;              
        uint32 createdAt;           
        uint32 updatedAt;           
        uint16 version;             
        RecordType recordType;      
        bool isActive;              
    }
    
    /**
     * @dev Access control for shared records
     */
    struct AccessGrant {
        address grantee;            
        uint32 grantedAt;          
        uint32 expiresAt;           
        bool canRead;               
        bool canWrite;              
    }
    
    /**
     * @dev Consent management
     */
    struct Consent {
        bool dataProcessing;        
        bool dataSharing;           
        uint32 consentDate;         
        uint32 expiresAt;           
    }
    
    // ============================================
    // STATE VARIABLES
    // ============================================
    
    // Core storage
    mapping(bytes32 => HealthRecord) public records;
    
    // User's records (recordId => exists)
    mapping(address => mapping(bytes32 => bool)) public userRecordExists;
    
    // Record count per user (for pagination)
    mapping(address => uint256) public userRecordCount;
    
    // Access control (recordId => grantee => AccessGrant)
    mapping(bytes32 => mapping(address => AccessGrant)) public accessGrants;
    
    // Consent (user => Consent)
    mapping(address => Consent) public userConsent;
    
    // Version count (recordId => version count)
    mapping(bytes32 => uint256) public versionCount;
    
    // Nonces for replay protection
    mapping(address => uint256) public nonces;
    
    // Emergency pause
    bool public paused;
    address public admin;
    
    // ============================================
    // EVENTS
    // ============================================
    
    event RecordCreated(
        bytes32 indexed recordId,
        address indexed owner,
        bytes32 dataCIDHash,
        RecordType recordType,
        uint256 timestamp
    );
    
    event RecordUpdated(
        bytes32 indexed recordId,
        address indexed updatedBy,
        bytes32 oldCIDHash,
        bytes32 newCIDHash,
        uint256 newVersion,
        uint256 timestamp
    );
    
    event RecordDeleted(
        bytes32 indexed recordId,
        address indexed owner,
        uint256 timestamp
    );
    
    event AccessGranted(
        bytes32 indexed recordId,
        address indexed owner,
        address indexed grantee,
        uint256 timestamp
    );
    
    event AccessRevoked(
        bytes32 indexed recordId,
        address indexed owner,
        address indexed grantee,
        uint256 timestamp
    );
    
    event ConsentUpdated(
        address indexed user,
        bool dataProcessing,
        bool dataSharing,
        uint256 timestamp
    );
    
    // ============================================
    // MODIFIERS
    // ============================================
    
    modifier onlyOwner(bytes32 _recordId) {
        require(records[_recordId].owner == msg.sender, "Not owner");
        _;
    }
    
    modifier hasAccess(bytes32 _recordId) {
        HealthRecord memory record = records[_recordId];
        require(record.isActive, "Record deleted");
        
        bool isOwner = record.owner == msg.sender;
        bool hasGrant = accessGrants[_recordId][msg.sender].canRead &&
                        (accessGrants[_recordId][msg.sender].expiresAt == 0 || 
                         accessGrants[_recordId][msg.sender].expiresAt > uint32(block.timestamp));
        
        require(isOwner || hasGrant, "Access denied");
        _;
    }
    
    modifier whenNotPaused() {
        require(!paused, "Contract paused");
        _;
    }
    
    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }
    
    // ============================================
    // CONSTRUCTOR
    // ============================================
    
    constructor() {
        admin = msg.sender;
        paused = false;
    }
    
    // ============================================
    // CORE FUNCTIONS
    // ============================================
    
    /**
     * @dev Create a new health record
     * @param _dataCIDHash Hash of IPFS CID 
     * @param _recordType Type of record
     * @return recordId Unique identifier for the record
     */
    function createRecord(
        bytes32 _dataCIDHash,
        RecordType _recordType
    ) external whenNotPaused returns (bytes32) {
        // Generate unique record ID
        bytes32 recordId = keccak256(
            abi.encodePacked(
                msg.sender,
                _dataCIDHash,
                block.timestamp,
                nonces[msg.sender]
            )
        );
        
        // Ensure record doesn't exist
        require(records[recordId].owner == address(0), "Record exists");
        
        // Check consent
        require(userConsent[msg.sender].dataProcessing, "Consent required");
        require(
            userConsent[msg.sender].expiresAt == 0 || 
            userConsent[msg.sender].expiresAt > uint32(block.timestamp),
            "Consent expired"
        );
        
        // Create record
        records[recordId] = HealthRecord({
            dataCIDHash: _dataCIDHash,
            owner: msg.sender,
            createdAt: uint32(block.timestamp),
            updatedAt: uint32(block.timestamp),
            version: 1,
            recordType: _recordType,
            isActive: true
        });
        
        // Update user's record tracking
        userRecordExists[msg.sender][recordId] = true;
        userRecordCount[msg.sender]++;
        versionCount[recordId] = 1;
        
        // Grant owner full access
        accessGrants[recordId][msg.sender] = AccessGrant({
            grantee: msg.sender,
            grantedAt: uint32(block.timestamp),
            expiresAt: 0,
            canRead: true,
            canWrite: true
        });
        
        // Increment nonce
        nonces[msg.sender]++;
        
        emit RecordCreated(
            recordId,
            msg.sender,
            _dataCIDHash,
            _recordType,
            block.timestamp
        );
        
        return recordId;
    }
    
    /**
     * @dev Update existing record (creates new version)
     * @param _recordId Record identifier
     * @param _newCIDHash New IPFS CID hash
     * @param _expectedVersion Expected current version (prevents race conditions)
     */
    function updateRecord(
        bytes32 _recordId,
        bytes32 _newCIDHash,
        uint16 _expectedVersion
    ) external whenNotPaused onlyOwner(_recordId) {
        HealthRecord storage record = records[_recordId];
        
        require(record.isActive, "Record deleted");
        require(record.version == _expectedVersion, "Version mismatch"); 
        
        bytes32 oldCIDHash = record.dataCIDHash;
        
        // Update record (Effects before Interactions)
        record.dataCIDHash = _newCIDHash;
        record.updatedAt = uint32(block.timestamp);
        record.version++;
        versionCount[_recordId]++;
        
        // Emit event (Interaction)
        emit RecordUpdated(
            _recordId,
            msg.sender,
            oldCIDHash,
            _newCIDHash,
            record.version,
            block.timestamp
        );
    }
    
    /**
     * @dev Soft delete record (for compliance)
     * @param _recordId Record identifier
     */
    function deleteRecord(bytes32 _recordId) 
        external 
        whenNotPaused 
        onlyOwner(_recordId) 
    {
        HealthRecord storage record = records[_recordId];
        require(record.isActive, "Already deleted");
        
        // Soft delete (Effects before Interactions)
        record.isActive = false;
        record.updatedAt = uint32(block.timestamp);
        
        // Emit event (Interaction)
        emit RecordDeleted(_recordId, msg.sender, block.timestamp);
        
    }
    
    // ============================================
    // ACCESS CONTROL FUNCTIONS
    // ============================================
    
    /**
     * @dev Share record with another address
     * @param _recordId Record identifier
     * @param _grantee Address to share with
     * @param _expiresAt Expiration timestamp (0 = never expires)
     * @param _canWrite Allow updates
     */
    function shareRecord(
        bytes32 _recordId,
        address _grantee,
        uint32 _expiresAt,
        bool _canWrite
    ) external whenNotPaused onlyOwner(_recordId) {
        require(_grantee != address(0), "Invalid address");
        require(_grantee != msg.sender, "Cannot share with self");
        require(records[_recordId].isActive, "Record deleted");
        
        // Check sharing consent
        require(userConsent[msg.sender].dataSharing, "Sharing consent required");
        
        // Grant access (Effects before Interactions)
        accessGrants[_recordId][_grantee] = AccessGrant({
            grantee: _grantee,
            grantedAt: uint32(block.timestamp),
            expiresAt: _expiresAt,
            canRead: true,
            canWrite: _canWrite
        });
        
        // Emit event (Interaction)
        emit AccessGranted(_recordId, msg.sender, _grantee, block.timestamp);
    }
    
    /**
     * @dev Revoke access to record
     * @param _recordId Record identifier
     * @param _grantee Address to revoke
     */
    function revokeAccess(bytes32 _recordId, address _grantee) 
        external 
        whenNotPaused 
        onlyOwner(_recordId) 
    {
        require(_grantee != msg.sender, "Cannot revoke own access");
        
        // Delete access grant 
        delete accessGrants[_recordId][_grantee];
        
        // Emit event (Interaction)
        emit AccessRevoked(_recordId, msg.sender, _grantee, block.timestamp);
    }
    
    // ============================================
    // CONSENT MANAGEMENT
    // ============================================
    
    /**
     * @dev Update user consent preferences
     * @param _dataProcessing Consent to process data
     * @param _dataSharing Consent to share data
     * @param _expiresAt When consent expires (0 = never)
     */
    function updateConsent(
        bool _dataProcessing,
        bool _dataSharing,
        uint32 _expiresAt
    ) external whenNotPaused {
        // Effects before Interactions
        userConsent[msg.sender] = Consent({
            dataProcessing: _dataProcessing,
            dataSharing: _dataSharing,
            consentDate: uint32(block.timestamp),
            expiresAt: _expiresAt
        });
        
        // Interaction
        emit ConsentUpdated(
            msg.sender,
            _dataProcessing,
            _dataSharing,
            block.timestamp
        );
    }
    
    // ============================================
    // VIEW FUNCTIONS (FREE - NO GAS)
    // ============================================
    
    /**
     * @dev Get record details
     * @param _recordId Record identifier
     * @return HealthRecord struct
     */
    function getRecord(bytes32 _recordId) 
        external 
        view 
        hasAccess(_recordId)
        returns (HealthRecord memory) 
    {
        return records[_recordId];
    }
    
    /**
     * @dev Check if user has access to record
     * @param _recordId Record identifier
     * @param _user Address to check
     * @return hasAccess Boolean
     */
    function checkAccess(bytes32 _recordId, address _user) 
        external 
        view 
        returns (bool) 
    {
        if (records[_recordId].owner == _user) return true;
        
        AccessGrant memory grant = accessGrants[_recordId][_user];
        if (!grant.canRead) return false;
        if (grant.expiresAt != 0 && grant.expiresAt <= uint32(block.timestamp)) return false;
        
        return true;
    }
    
    /**
     * @dev Get user's record count
     * @param _user User address
     * @return count Number of records
     */
    function getUserRecordCount(address _user) 
        external 
        view 
        returns (uint256) 
    {
        return userRecordCount[_user];
    }
    
    /**
     * @dev Get record version count
     * @param _recordId Record identifier
     * @return count Number of versions
     */
    function getVersionCount(bytes32 _recordId) 
        external 
        view 
        returns (uint256) 
    {
        return versionCount[_recordId];
    }
    
    /**
     * @dev Get user's consent status
     * @param _user User address
     * @return Consent struct
     */
    function getConsent(address _user) 
        external 
        view 
        returns (Consent memory) 
    {
        return userConsent[_user];
    }
    
    /**
     * @dev Check if consent is valid
     * @param _user User address
     * @param _consentType Type of consent ("processing" or "sharing")
     * @return isValid Boolean
     */
    function hasValidConsent(address _user, string memory _consentType) 
        external 
        view 
        returns (bool) 
    {
        Consent memory consent = userConsent[_user];
        
        // Check expiry
        if (consent.expiresAt != 0 && consent.expiresAt <= uint32(block.timestamp)) {
            return false;
        }
        
        // Check specific consent type
        bytes32 typeHash = keccak256(abi.encodePacked(_consentType));
        
        if (typeHash == keccak256(abi.encodePacked("processing"))) {
            return consent.dataProcessing;
        } else if (typeHash == keccak256(abi.encodePacked("sharing"))) {
            return consent.dataSharing;
        }
        
        return false;
    }
    
    // ============================================
    // ADMIN FUNCTIONS
    // ============================================
    
    /**
     * @dev Pause contract in emergency
     */
    function pause() external onlyAdmin {
        paused = true;
    }
    
    /**
     * @dev Unpause contract
     */
    function unpause() external onlyAdmin {
        paused = false;
    }
    
    /**
     * @dev Transfer admin rights
     * @param _newAdmin New admin address
     */
    function transferAdmin(address _newAdmin) external onlyAdmin {
        require(_newAdmin != address(0), "Invalid address");
        admin = _newAdmin;
    }
}