// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PreservationAttack {
    uint storage0;
    uint storage1;
    uint storage2;
    constructor () {}

function setTime(uint256 value) public {
    storage2 = value;
}

}