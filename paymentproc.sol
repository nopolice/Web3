// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "./ERC20.sol";


contract PaymentProcessor {
    address public admin;
    IERC20 public MyTokenTest;
    
    event PaymentDone(
        address payer,
        uint amount,
        uint TokenID,
        uint date
    );

    constructor (address adminAddress, address MyTokenTestAddress) {
        admin = adminAddress;
        MyTokenTest = IERC20(MyTokenTestAddress);
    }
    function pay(uint amount, uint paymentID) external {
   
    MyTokenTest.transferFrom(msg.sender, admin, amount);
    emit PaymentDone(msg.sender, amount, paymentID, block.timestamp);
}
}