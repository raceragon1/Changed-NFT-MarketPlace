// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.11;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC1155/ERC1155.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract MintMine is ERC1155, Ownable{

    constructor() ERC1155(""){

    }

    function mint(address to, uint256 id) public onlyOwner{
        _mint(to, id, 1,"");
    }

    function burn(address from, uint256 id) public {
        _burn(from, id, 1);
    }

    function transfer(address from,address to,uint256 id) public {
        safeTransferFrom(from,to,id,1,"");
    }
}