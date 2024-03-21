// SPDX-License-Identifier: MIT

pragma solidity = 0.8.0 ;

contract HealthRecords {
    
    struct Record {
        address[] doctors;
    }
    
    mapping(string => mapping(string => Record)) private patientRecords;  

    function getPatientsRecords(string memory profileId , string memory documentId) public view returns (Record memory) {
        return patientRecords[profileId][documentId];
    }
 

    function addPatient(string memory profileId) public {
        patientRecords[profileId]["tp"] =  Record(new address[](0));
    }


    function addRecord(string memory profileId, string memory documentId) public {
       patientRecords[profileId][documentId] = Record(new address[](0));
    }
    
    function deleteRecord(string memory profileId , string memory documentId ) public {
        delete patientRecords[profileId][documentId];
    }
    
  
    function grantAccess(string memory profileId, string memory documentId, address _doctor) public {
        
       patientRecords[profileId][documentId].doctors.push(_doctor);
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
    }
}