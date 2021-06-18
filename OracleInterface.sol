pragma solidity ^0.5.0;

contract OracleInterface {
 
    function getVerification(uint _id) public view returns (
        string name, 
        string project, 
        uint date,   
        uint result);

    function testConnection() public pure returns (bool);

    function addTestData() public; 
}
