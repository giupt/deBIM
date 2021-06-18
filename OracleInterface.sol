pragma solidity ^0.4.17;

contract OracleInterface {
 
    function getVerification(uint id) public view returns (
        string name, 
        string project, 
        uint date,   
        uint result);

    function testConnection() public pure returns (bool);

    function addTestData() public; 
}
