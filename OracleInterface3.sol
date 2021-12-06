pragma solidity ^0.4.17;

contract OracleInterface {
    Verification[] verifications;
    mapping(bytes32 => uint) verificationIdToIndex;

    function getVerification(bytes32 _verificationId) public view returns (
       bytes32 id,
       string discipline,
       string team,
       uint cycle,
       uint date,
       uint result);

    function testConnection() public pure returns (bool);

    function addTestData() public; 
}
