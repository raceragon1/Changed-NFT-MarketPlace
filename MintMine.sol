// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.11;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract MintMine is ERC721, Ownable{

    uint256 tokenCounter;


    mapping(uint256 => address) tokenIdToAddress;
    mapping(uint256 => string) tokenIdtoTokenUri;
    mapping(string => bool) URIs;

    event Created(uint256 value);
    event Minter(address value);
    event Burnt(uint256 value);
    event Transfered(uint256 value);
    event TransferedTo(address value);



    constructor() ERC721("",""){ 
        tokenCounter = 0 ;
    }



    function Create(string memory _tokenURI) public{
        require(!URIs[_tokenURI], "Token URI already exists");
        URIs[_tokenURI] = true;
        uint256 _tokenId = tokenCounter;
        tokenIdtoTokenUri[_tokenId] = _tokenURI;
        tokenIdToAddress[_tokenId] = msg.sender;

       //   tokenURI(_tokenId, _tokenURI);
        
        tokenCounter +=1;    

        emit Created(_tokenId);
    }

    function Mint(uint256 _tokenId) public {
        address _owner = tokenIdToAddress[_tokenId];
        _safeMint(_owner, _tokenId,"");

        emit Minter(_owner);
    }

    function Burn(uint256 _tokenId) public onlyOwner {
        _burn(_tokenId);
        tokenIdToAddress[_tokenId] = address(0);
        emit Burnt(_tokenId);
    }

    function SafeTransfer(address _from, address _to, uint256 _tokenId) public onlyOwner {
        safeTransferFrom(_from,_to,_tokenId);

        tokenIdToAddress[_tokenId] = _to;
        
        emit Transfered(_tokenId);
        emit TransferedTo(_to);
    }
}

