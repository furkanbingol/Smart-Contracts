// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract Property{
    int public price;     //default visibility = private && "public variables" already has "Getter Function"
    string public location = "London";

    /* A Solidity function can be either a setter or a getter function, 
    not both at the same time. */

    function setPrice(int _price) public{  
        price = _price;   //setter
    }

    function getPrice() public view returns(int){  //view: this is a READ-ONLY function, doesn't change the storage
        return price;     //getter
    }

    function setLocation(string memory _location) public{
        location = _location;
    }
}
