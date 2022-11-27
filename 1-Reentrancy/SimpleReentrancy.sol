// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

contract SimpleReentrancy {
    
    mapping (address => uint) private balances;
    
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }
    
    function withdraw(uint _amount) public returns (uint) {
        require(_amount <= balances[msg.sender]);
        msg.sender.call.value(_amount)("");
        
        balances[msg.sender] = balances[msg.sender] - _amount;
        return getMyBalance();
    }
    
    function getMyBalance() public view returns (uint) {
        return balances[msg.sender]; // show balance of sender
    }
    
}