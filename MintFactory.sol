// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.11;
import "./MintPalace.sol";
import "./MintMine.sol";


//ERC 20 Token Factory
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
        
        MintPalace(address(tokenContractArray[_tokenContarctIndex])).mint(_minter,_amount);
    }

    function transferERC20tokens(address _to, uint256 _amount, uint256 _tokenContarctIndex) public{
        
        MintPalace(address(tokenContractArray[_tokenContarctIndex])).transfer(_to,_amount);
    }
 
   function viewERC20tokens(uint256 _tokenContarctIndex) public view returns(string memory, string memory, uint256){
       
        MintPalace ERC20TokenContarct = MintPalace(address(tokenContractArray[_tokenContarctIndex]));
        return(ERC20TokenContarct.name(),ERC20TokenContarct.symbol(),ERC20TokenContarct.totalSupply());
    }    


}