// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract myContract{
    uint private price;
    address public owner;

    constructor()
    {
        price = 0;
        owner = msg.sender;
    }

    //Function Modifier
    modifier onlyOwner()
    {
        require(msg.sender == owner);
    }
    function changeOwner(address _owner) public onlyOwner
    {
        owner = _owner;
    }

    function setPrice(uint _price) public
    {
        price = _price;
    }
    
    /// @notice Returns the price of the Property
    function getPrice() view public returns (uint)
    {
        return price;
    }

    //EVENT
    event OwnerChanged(address owner);
}
