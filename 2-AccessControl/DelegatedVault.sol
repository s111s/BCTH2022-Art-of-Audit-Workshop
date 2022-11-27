pragma solidity 0.6.12;

contract DelegatedVault {
    uint256 public balance;
    
    function setBalance(uint256 _value) public {
        balance = _value;
    }
}

contract DelegateCaller {
    address public owner;
    uint256 public balance = 5;
    address vaultPointer = address(new DelegatedVault());
    
    constructor() public {
        owner = msg.sender;
    }

    function setBalance(uint256 _value) public {
        vaultPointer.delegatecall(abi.encodeWithSignature("setBalance(uint256)", _value));
    }
    
    function isOwner() public view returns (bool) {
        return msg.sender == owner;
    }
}
