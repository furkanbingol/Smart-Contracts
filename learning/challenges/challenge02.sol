// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;
/*
Consider the solution from the previous challenge.
Add a public state variable of type address called owner.
Declare the constructor and initialize all the state variables in the constructor. 
The owner should be initialized with the address of the account that deploys the contract.
*/

contract CryptosToken{
    string public constant name = "Cryptos";
    uint supply;  //internal variable
    address public owner;

    constructor(uint _supply){
        supply = _supply;
        owner = msg.sender;
    }
    
    function setSupply(uint _supply) public{
        supply = _supply;
    }

    function getSupply() public view returns(uint){
        return supply;
    }
}
