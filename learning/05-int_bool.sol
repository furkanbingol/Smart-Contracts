// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract Property{
    //Solidity are not yet support Float and Double(floating point numbers)
    
    bool public sold; //bool "default" value: false

    //int = int256
    //uint = uint256 (unsigned int)

    uint8 public x = 255;   //max value of uint8 is 255 [0,255]
    int8 public y = -128;   //max value of int8 is 127  [-128,127]

    function f1() public{
        x++;  //integer overflow
        y--;  //integer underflow
        //transaction reverts to the initial state
    }

    /*
    SafeMath library prevents overflows
    solidity >0.8 , compiler revert on underflow and overflow (no library needed) 
    */
}
