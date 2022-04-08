// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;
/*
Change the state variable name to be declared as a public constant.
Declare a setter and a getter function for the supply state variable.
*/
contract CryptosToken{
    string public constant name = "Cryptos";
    uint supply;

    function setSupply(uint _supply) public{
        supply = _supply;
    }

    function getSupply() public view returns(uint){
        return supply;
    }
}
