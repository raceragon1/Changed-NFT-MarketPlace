// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.11;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract MintMine is ERC721, Ownable{

    event minted(uint256 value);
    event burnt(uint256 value);
    event transfered(uint256 value);

    constructor() ERC721("",""){

    }

    function mint(address to, uint256 id) public onlyOwner{
        _mint(to, id);
        emit minted(_id);
    }

    function burn(uint256 id) public onlyOwner {
        _burn(id);
        emit burnt(_id);
    }

    function transfer(address from,address to,uint256 id) public onlyOwner {
        safeTransferFrom(from,to,id);
        emit transfered(_id);
    }
}