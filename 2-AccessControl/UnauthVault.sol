// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

contract UnauthVault {
    
    address public owner;
    mapping (address => uint) private balances;
    uint256 public vaultBalance;
    
    constructor () public {
        owner = msg.sender;
        vaultBalance = 100000000000000000000;
    }

    function withdrawAll() public returns (bool) {
        require(msg.sender == owner);
        balances[owner] += vaultBalance;
        vaultBalance -= vaultBalance;
        return true;
    }

    function ownerBalance() public view returns (uint256) {
        return balances[owner];
    }

    function kill() public {
        selfdestruct(msg.sender);
    }
}