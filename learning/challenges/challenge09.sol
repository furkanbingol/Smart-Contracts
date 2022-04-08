// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;
//Declare a function that concatenates two strings.

contract Concatenate{
    string public s1 = "aaa";
    string public s2 = "bbb";
    string public new_str;

    function concatenate1() public view returns(string memory){
        string memory s3;
        s3 = string(abi.encodePacked(s1,s2));
        return s3;
    }

    function concatenate2() public{
        new_str = string(abi.encodePacked(s1,s2));
    }
}
