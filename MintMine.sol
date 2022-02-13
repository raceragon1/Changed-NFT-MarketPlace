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

    function mint(address _to, uint256 _id) public onlyOwner{
        _mint(_to, _id);
        emit minted(_id);
    }

    function burn(uint256 _id) public onlyOwner {
        _burn(_id);
        emit burnt(_id);
    }

    function transfer(address _from,address _to,uint256 _id) public onlyOwner {
        safeTransferFrom(_from,_to,_id);
        emit transfered(_id);
    }
}

