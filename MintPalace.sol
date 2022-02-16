// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.11;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";



contract MintPalace is ERC20, Ownable{

    uint256 uniqueIdCounter;
    uint256 public _totalSupply;

    mapping(uint => uint) uniqueToNFTid;
    mapping(uint => address) public uniqueToAddress ;
    mapping (uint => uint) uniqueIdToTotalSupply;

    constructor()  ERC20("","") {
     uniqueIdCounter = 0;
    }

    //store(Stake)
    function Store(uint _tokenId) public {
        uint256 _uniqueId;
        _uniqueId == uniqueIdCounter;

        uniqueToNFTid[_uniqueId] = _tokenId;
        uniqueToAddress[_uniqueId] = msg.sender;

        //make transfer fuction, transfer nftid to the contract

        uniqueIdCounter += 1;
        
    }
    //create
    function Create(string memory name_, string memory symbol_) public{
        
    }

    //tear(mint)
    function Tear(uint256 totalSupply_, uint256 _uniqueId) public {
        require(uniqueToAddress[_uniqueId] == msg.sender,"Not your Token");
        uniqueIdToTotalSupply[_uniqueId] = totalSupply_;
        _totalSupply = totalSupply_;
        totalSupply();
    }
  
    //Retrive(burnall)
    function Revive(uint _uniqueId) public{

        //require msg sender to have totalsupply of token
        //require(_balances[msg.sender] == _totalSupply,"Insufficient Tokens");

        //burn function set to burn total supply account is msgsender
        _burn(msg.sender, _totalSupply);

        //get linked nft id
       // uniqueToNFTid[_uniqueId] = _nftId;

        //Send the NFT linked to token Id back

    }
}