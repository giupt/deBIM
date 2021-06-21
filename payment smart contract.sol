pragma solidity ^0.4.17;

import "https://github.com/giupt/oracle/blob/main/OracleInterface2.sol";
import "https://github.com/jrkosinski/oracle-example/blob/part2-step1/client/contracts/Ownable.sol";


/// @title BIM verification
/// @notice handles payouts to design teams for successful BIM verifications 
contract BIMVerification is Ownable {
    address public owner = msg.sender;
    
    modifier onlyOwner {
        require (msg.sender == owner);
        _;
    }

    struct Verification {
        uint id;            
        string name;   
        string project;    
        uint date;      
        uint result;
    }
    
    //this creates a simple mapping of an ethereum address to a number
    mapping(address => uint) public balances;

    
    /// send/deposit money in the contract
    function deposit() onlyOwner public payable {
        balances[msg.sender] += msg.value;
    }
    
    //This returns the full amount of ETH the contract holds
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
    
    //verification results oracle 
    address internal BIMOracleAddr = 0;
    OracleInterface internal BIMOracle = OracleInterface(BIMOracleAddr); 


    /// @notice sets the address of the BIM oracle contract to use 
    /// @dev setting a wrong address may result in false return value, or error 
    /// @param _oracleAddress is the address of the BIM oracle 
    /// @return true if connection to the new oracle address was successful
    function setOracleAddress(address _oracleAddress) external onlyOwner returns (bool) {
        BIMOracleAddr = _oracleAddress;
        BIMOracle = OracleInterface(BIMOracleAddr); 
        return BIMOracle.testConnection();
    }

    /// @notice gets the address of the BIM oracle being used 
    /// @return the address of the currently set oracle 
    function getOracleAddress() external view returns (address) {
        return BIMOracleAddr;
    }
 
    /// @notice returns the data of the specified verification 
    /// @param _id is the id of the desired verification
    /// @return verification data 
    function getVerification(uint _id) public view returns (
        string name, 
        string project, 
        uint date,   
        uint result) {

        return BIMOracle.getVerification(_id);
    }
    
    /// @notice returns the result of the  verification 
    /// @param _result is the id of the desired verification
    function getResult(uint _result) public pure returns (bool) {
        
        if (_result >= 90) {
        return true;
    }
        else {
        revert('payment cant be done');
    }
    }
    
    //a specific account can withdraw the money if the result is approved this withdraws all the money that an account has send to the contract
    /// @param _amount is the amount of money to be sent to the design team 
    function transfer(address _receiver, uint _amount, uint _result) onlyOwner public payable {
        require(balances[msg.sender] >= _amount, "Insufficient funds");
        require(_result >=90);
        balances[msg.sender] -= _amount;
        balances[_receiver] += _amount;
    }
    

    /// @notice for testing; tests that the BIM oracle is callable 
    /// @return true if connection successful 
    function testOracleConnection() public view returns (bool) {
        return BIMOracle.testConnection(); 
    }
}
