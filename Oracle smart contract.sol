pragma solidity ^0.4.17;

import "https://github.com/jrkosinski/oracle-example/blob/part2-step1/oracle/contracts/Ownable.sol";


/// @title BIMOracle
/// @notice Collects and provides information on BIM verifications and their results 
contract BIMOracle is Ownable {
    
    //defines a verification along with its outcome and result
    struct Verification {
        uint id;                        //unique id
        string name;                    //human-friendly name of the design team
        string project;                 //human-friendly name of the project
        uint date;                      //date of the verification execution
        uint result;                    //the achieved compliance percentage of the verification (0-100)
    }
    
    mapping (uint256 => Verification) verifications;
    
    function addVerification(uint id, string name, string project, uint date, uint result) onlyOwner public {
    verifications[id] = Verification(id, name, project, date, result);
    }
    
    function getVerification(uint id) public view returns (string, string, uint, uint) {
    Verification storage verification = verifications[id];
    return (verification.name, verification.project, verification.date, verification.result);
    }

    /// @notice can be used by a client contract to ensure that they've connected to this contract interface successfully
    /// @return true, unconditionally 
    function testConnection() public pure returns (bool) {
        return true; 
    }

    /// @notice gets the address of this contract 
    /// @return address 
    function getAddress() public view returns (address) {
        return this;
    }
}
