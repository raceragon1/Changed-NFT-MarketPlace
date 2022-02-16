// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.11;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";



contract MintPalace is ERC20, Ownable{

    uint256 uniqueIdCounter;
    

    mapping(uint => uint) uniqueToTokenId;
    mapping(uint => address) uniqueToAddress;

    constructor()  ERC20("","") {
     uniqueIdCounter = 0;
    }

    //store(Stake)
    function Store(uint _tokenId) public {
        uint256 _uniqueId;
        _uniqueId == uniqueIdCounter;

        uniqueToTokenId(_uniqueId) = _tokenId;
        uniqueToAddress(_uniqueId) = msg.sender;
        
        uniqueIdCounter += 1;
        
    }
    //create
    function Create(string memory _name, string memory _symbol, uint256 _uniqueId) public{

    }

    //tear(mint)
    
    //fix(burn)

    //Retrive(Unstake)

}