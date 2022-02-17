// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.11;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Counters.sol";

contract MintMine is ERC721URIStorage{
    
    constructor() ERC721("MintMine","MMT"){ 
    }
    using Counters for Counters.Counter;
    Counters.Counter private tokenIdCounter;

    function mint(string memory _tokenURI) public{   
        uint tokenId = tokenIdCounter.current();

        _safeMint(msg.sender, tokenId,"");
        _setTokenURI(tokenId, _tokenURI);

        tokenIdCounter.increment();
    }

    function burn(uint256 tokenId) public { 
        _burn(tokenId);   
    }

    function safeTransfer(address _from, address _to, uint256 tokenId) public {
        safeTransferFrom(_from,_to,tokenId);
    }

}