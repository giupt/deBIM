pragma solidity ^0.4.17;

contract OracleInterface {
 
    function getVerification(bytes32 _id) public view returns (
        string name, 
        string project, 
        uint date,   
        uint result);

    function testConnection() public pure returns (bool);

    function addTestData() public; 
}
