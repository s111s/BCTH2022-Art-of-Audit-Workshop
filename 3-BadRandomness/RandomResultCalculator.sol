// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

contract RandomResultCalculator {
    
    function veryBadRandom() public view returns(uint){
        return uint(keccak256(abi.encodePacked(block.number, msg.sender)));
    }
    
    function badRandom() public view returns(uint){
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, msg.sender, block.coinbase)));
    }
    
}