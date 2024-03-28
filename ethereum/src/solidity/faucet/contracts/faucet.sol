// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract owned {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can call this function.");
        _;
    }
}

contract mortal is owned {
    bool activate = true;

    modifier isActivate() {
        require(activate, "Contract has been deactivated.");
        _;
    }

    function deactivate() public onlyOwner {
        address payable addr = payable(owner);
        (bool success, ) = addr.call{value: address(this).balance}("");
        require(success, "Transfer failed.");
        activate = false;
    }
}

contract Faucet is mortal {
    event Withdrawal(address indexed to, uint amount);
    event Deposit(address indexed from, uint amount);

    function withdraw(uint withdraw_amount) public isActivate {
        require(
            withdraw_amount <= 0.1 ether,
            "Withdrawal amount must be less than 0.1 ether."
        );
        require(
            address(this).balance >= withdraw_amount,
            "Insufficient balance in faucet for withdrawal request."
        );
        (bool success, ) = msg.sender.call{value: withdraw_amount}("");
        require(success, "Transfer failed.");
        emit Withdrawal(msg.sender, withdraw_amount);
    }

    fallback() external payable isActivate {
        emit Deposit(msg.sender, msg.value);
    }

    receive() external payable isActivate {
        emit Deposit(msg.sender, msg.value);
    }
}
