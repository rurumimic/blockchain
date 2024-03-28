// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Faucet {
    function withdraw(uint withdraw_amount) public {
        require(
            withdraw_amount <= 100000000000000000,
            "Withdrawal amount must be less than 0.1 ether"
        );
        (bool success, ) = msg.sender.call{value: withdraw_amount}("");
        require(success, "Transfer failed.");
    }

    fallback() external payable {}

    receive() external payable {}
}
