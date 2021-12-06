pragma solidity ^0.4.17;

contract OracleInterface {
    Verification[] verifications;
    mapping(bytes32 => uint) verificationIdToIndex;

    //defines a verification along with its result
    struct Verification {
        bytes32 id;
        string discipline;
        string team;
        uint cycle;
        uint date;
        uint result;
    }

    function verificationExists(bytes32 _verificationId) public view returns (bool); 

    function getVerification(bytes32 _verificationId) public view returns (
       bytes32 id;
       string discipline;
       string team;
       uint cycle;
       uint date;
       uint result);

    function testConnection() public pure returns (bool);

    function addTestData() public; 
}
