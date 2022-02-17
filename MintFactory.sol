// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.11;
import "./MintPalace.sol";
import "./MintMine.sol";



contract MintFactory{

    constructor() {

    }
/*
    //store(Stake)
    function Store(uint _tokenId) public {
      MintMine.safeTransferFrom(msg.sender,address(this), _tokenId);
        
    }
*/
    //create
    MintPalace[] public tokenContractArray;

    function createTokenContract(string memory _name, string memory _symbol) public{
       MintPalace tokenContract = new MintPalace(_name,_symbol);
       tokenContractArray.push(tokenContract);    
    }


    function mintERC20tokens(uint256 _amount, address _minter, uint256 _tokenContarctIndex) public{
        //require you to deployer of contract
        MintPalace(address(tokenContractArray[_tokenContarctIndex])).mint(_minter,_amount);
    }
 
   function viewERC20tokens(uint256 _tokenContarctIndex) public view returns(string memory, string memory, uint256){
        //require you to deployer of contract
        MintPalace ERC20TokenContarct = MintPalace(address(tokenContractArray[_tokenContarctIndex]));
        return(ERC20TokenContarct.name(),ERC20TokenContarct.symbol(),ERC20TokenContarct.totalSupply());
    }    


}