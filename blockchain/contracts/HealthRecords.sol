// SPDX-License-Identifier: MIT

pragma solidity = 0.8.0 ;

contract HealthRecords {
    
    struct Record {
        address[] doctors;
    }
    //authid => documentid => []address
    mapping(string => mapping(string => Record)) private patientRecords;
    mapping(address => string[]) private sharedRecords;  

    function getPatientsRecords(string memory profileId , string memory documentId) public view returns (Record memory) {
        return patientRecords[profileId][documentId];
    }


    function getsharedRecords(address _doctor) public view returns (string[] memory){
        return sharedRecords[_doctor];
    }
 

    function addPatient(string memory profileId) public {
        patientRecords[profileId]["tp"] =  Record(new address[](0));
    }


    function addRecord(string memory profileId, string memory documentId) public {
       patientRecords[profileId][documentId] = Record(new address[](0));
    }
    
    function deleteRecord(string memory profileId , string memory documentId , address[] memory doctors ) public {
        delete patientRecords[profileId][documentId];
        for (uint256 i = 0; i < doctors.length; i++) {
            for(uint j =0 ; j < sharedRecords[doctors[i]].length ; j++){
                if(keccak256(abi.encodePacked(sharedRecords[doctors[i]][j])) == keccak256(abi.encodePacked(documentId)) ){
                    delete sharedRecords[doctors[i]][j];
                }
            }
        }
    }
    
  
    function grantAccess(string memory profileId, string memory documentId, address _doctor) public {
 
       patientRecords[profileId][documentId].doctors.push(_doctor);

       sharedRecords[_doctor].push(documentId);
    }
    
    function revokeAccess(string memory profileId, string memory documentId, address _doctor) public {
        address[] storage doctors = patientRecords[profileId][documentId].doctors;
        for (uint256 i = 0; i < doctors.length; i++) {
            if (doctors[i] == _doctor) {
                doctors[i] = doctors[doctors.length - 1];
                doctors.pop();
                break;
            }
        }

        for(uint j =0 ; j < sharedRecords[_doctor].length ; j++){
                if(keccak256(abi.encodePacked(sharedRecords[_doctor][j])) == keccak256(abi.encodePacked(documentId)) ){
                    delete sharedRecords[_doctor][j];
                }
        }    
    }
}