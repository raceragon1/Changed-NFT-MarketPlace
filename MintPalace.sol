// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.11;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";




contract MintPalace is ERC20{
    string _name;
    string _symbol;


    constructor(string memory name_, string memory symbol_) ERC20( _name, _symbol){
        _name = name_;
        _symbol = symbol_;
    }

    function mint(address _minter, uint256 _amount) public{
        _mint(_minter, _amount);
    }

}