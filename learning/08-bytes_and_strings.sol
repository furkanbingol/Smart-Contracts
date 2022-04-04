// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract BytesAndStrings{
    /*
    "bytes" in Solidity represents a "dynamic array of bytes". It’s a shorthand for byte[]
    On the other hand bytes1, bytes2, ..., bytes32 are "fixed-size arrays of 1, 2, ..., 32 bytes".
    */
    bytes public b1 = 'abc';     //b1 = 0x616263
    string public s1 = 'abc';    //s1 = abc

    //we can not add elements to a string variable, as we can to a variable of type bytes
    //bytes and strings are REFERENCE TYPES
    //fixed size arrays use LESS GAS than dynamic arrays

    function addElement() public{
        b1.push('x');    //we have added an element to the end of the byte's array
        //s1.push('x');  //ERROR! we cannot use push() for string
    }

    function getElement(uint i) public view returns(bytes1){
        return b1[i];
        //return s1[i];  //ERROR! Index access for string is not possible
    }

    function getLength() public view returns(uint){
        return b1.length;
        //return s1.length;  //ERROR! we can not get the length of a string with "length" keyword
    }
}
