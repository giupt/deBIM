pragma solidity ^0.4.17;

contract OracleInterface {
 

    function getVerification(bytes32 _verificationId) public view returns (
        bytes32 id,
        string name, 
        uint date, 
        uint result);


    function testConnection() public pure returns (bool);

    function addTestData() public; 
}
