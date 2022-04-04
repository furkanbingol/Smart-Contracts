// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

// Solidity Data Types: int, bytes, address, mapping, struct

contract FixedSizeArrays{
    uint[3] public numbers = [1,2,3];

    function setElements(uint index, uint value) public{
        numbers[index] = value;
    }

    function getLength() public view returns(uint){
        return numbers.length;
    }

    //1 byte: 2 hexadecimal characters
    //  0x  : hexadecimal prefix
    bytes1 public b1; //default value: 0x00
    bytes2 public b2; //default value: 0x0000
    bytes3 public b3; //default value: 0x000000
    bytes4 public b4;
    //.. up to bytes32

    function setBytesArray() public{
        b1 = 'a';       //b1 = 0x61  ((hex)61: 'a' in ASCII)
        b2 = 'ab';      //b2 = 0x6162
        b3 = 'abc';     //b3 = 0x616263
        //b3[0] = 'a';  //ERROR => can not change individual bytes
        b4 = 'z';       //b4 = 0x7a000000
    }
}
