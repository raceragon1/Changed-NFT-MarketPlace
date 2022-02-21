// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.11;
import "./MintPalace.sol";
import "./MintMine.sol";


//Problem Statement - ERC 20 Token Factory, Store NFTs, create Tokens against it.
contract MintFactory {

    //Array of ERC20 Contracts deployed
    MintPalace[] public tokenContractArray;

    //creating mapping of NFT stored to make an condition for minitng ERC20 tokens against it
    mapping (address => mapping(uint => bool)) tokenToBool;

    //mapping ERC 20 token address to NFT id
    mapping (address => uint) ERC20AddressToTokenId; 
    
    //Creating mapping of NFT to address (original staker) that deposited the NFT 
    mapping (uint => address) tokenToNFTAddress; 

    
    constructor() {}


    //store(Stake) function to deposit NFT
    function Store(address _NFTcontarctAddress, uint _NFTtokenId) public {
        MintMine(_NFTcontarctAddress).transfer(
            msg.sender, 
            address(this), 
            _NFTtokenId
        );
        
        tokenToNFTAddress[_NFTtokenId] = _NFTcontarctAddress;

        tokenToBool[msg.sender][_NFTtokenId] = true;
    }


    //Function to retrive NFT
    //Should be able to retrive without making token

    function retrive(uint256 _tokenContarctIndex) public {
        address ERC20Address = address(tokenContractArray[_tokenContarctIndex]);

        MintPalace(ERC20Address).burnall();

        uint _NFTtokenId = ERC20AddressToTokenId[ERC20Address];
        address _NFTcontarctAddress = tokenToNFTAddress[_NFTtokenId];
        
        MintMine(_NFTcontarctAddress).transfer(
            address(this), 
            msg.sender, 
            _NFTtokenId
        );
 
    }

    //create, creating ERC 20 tokens for Stored NFTs
    function createTokenContract(
        string memory _name, 
        string memory _symbol, 
        uint _NFTtokenId
    ) 
        public 
    {

       require(tokenToBool[msg.sender][_NFTtokenId] == true) ;

       MintPalace tokenContract = new MintPalace(_name,_symbol);
       tokenContractArray.push(tokenContract);    
    }

    //Minting tokens
    function mintERC20tokens(
        uint256 _amount, 
        address _minter, 
        uint256 _tokenContarctIndex
    ) 
        public 
    {
        MintPalace(address(tokenContractArray[_tokenContarctIndex])).mint(_minter,_amount);
    }


    //Transfering tokes
    function transferERC20tokens(
        address _to, 
        uint256 _amount, 
        uint256 _tokenContarctIndex
    ) 
        public 
    {
        MintPalace(address(tokenContractArray[_tokenContarctIndex])).transfer(_to,_amount);

    }
 

    //View token information
   function viewERC20tokens(uint256 _tokenContarctIndex) public view returns (
       string memory, 
       string memory, 
       uint256
       ) 
    {
        MintPalace ERC20TokenContarct = MintPalace(address(tokenContractArray[_tokenContarctIndex]));

        return (
            ERC20TokenContarct.name(),
            ERC20TokenContarct.symbol(),
            ERC20TokenContarct.totalSupply()
        );
    }   

/*
Still have to add require statements for all
create a connect between the NFT and ERC token
*/ 

}