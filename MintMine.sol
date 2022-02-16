// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.11;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract MintMine is ERC721, Ownable{

    uint256 tokenCounter;
    

    mapping(uint256 => address) NFTidToAddress;
    mapping(uint256 => string) NFTidToTokenUri;
    mapping(string => bool) URIs;

    event Created(uint256 value);
    event Minter(address value);
    event Burnt(uint256 value);
    event Transfered(uint256 value);
    event TransferedTo(address value);

    modifier tokenOwner(uint _nftId){
        require(NFTidToAddress[_nftId] == msg.sender, "Not your Token");
        _;
    }



    constructor() ERC721("",""){ 
        tokenCounter = 0 ;
    }



    function Mint(string memory _tokenURI) public{
        require(!URIs[_tokenURI], "Token URI already exists");
        URIs[_tokenURI] = true;
        
        uint _nftId;
        
        _nftId == tokenCounter;
        NFTidToTokenUri[_nftId] = _tokenURI;
        NFTidToAddress[_nftId] = msg.sender;

       //   tokenURI(_nftId, _tokenURI);
    
        _safeMint(msg.sender, _nftId,"");
        tokenCounter +=1;  

        emit Minter(msg.sender); 
        emit Created(_nftId);

    }


    function Burn(uint256 _nftId) public tokenOwner(_nftId) {
       
        _burn(_nftId);
        NFTidToAddress[_nftId] = address(0);
        emit Burnt(_nftId);
    }

    function SafeTransfer(address _from, address _to, uint256 _nftId) public tokenOwner(_nftId) {
        safeTransferFrom(_from,_to,_nftId);
        NFTidToAddress[_nftId] = _to;
        
        emit Transfered(_nftId);
        emit TransferedTo(_to);
    }
}

