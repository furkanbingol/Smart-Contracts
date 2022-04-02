// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract Property{
    int public price;
    string public location;
    address public owner;
    int constant area = 100;  //constant: we need to set their values at Declaration
    int immutable size = 5;   //it is okay!
    int immutable weight;     //it can still be assigned at Constructor

    //'constant' and 'immutable' state variables cannot be modified(and the gas costs of their are much LOWER)

    /*
    --IMPORTANT--
    constructor cannot change the owner to a "new" address because the constructor is
    called "only once" when the contract is deployed
    */
    constructor(int _price, string memory _location, int _weight){
        price = _price;
        location = _location;
        weight = _weight;
        owner = msg.sender; //the address of the account will be stored in msg.sender and it becomes the 'owner' of the contract
    }

    function setPrice(int _price) public{
        price = _price;
    }

    function setLocation(string memory _location) public{
        location = _location;
    }
}
