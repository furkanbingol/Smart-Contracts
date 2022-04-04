// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract DynamicArrays{
    /*
    --Dynamic Arrays--
    .length = size of dynamic array
    .push   = appends an element to the end of the dynamic array
    .pop    = delete an element from the end of the dynamic array
    */

    uint[] public num;

    function getLength() public view returns(uint){
        return num.length;
    }

    function addElement(uint item) public{
        num.push(item);
    }

    function popElement() public{
        num.pop();
    }

    function getElement(uint i) public view returns(uint){
        if(i < num.length){
            return num[i];
        }
        return 0;
    }

    function f() public{
        uint[] memory y = new uint[](3);  //it is not possible to resize "memory arrays", so push() and pop() are not avaliable
        y[0] = 10;
        y[1] = 20;
        y[2] = 30;
        num = y;
    }
}
