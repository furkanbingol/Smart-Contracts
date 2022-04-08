// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;
/*
Change the visibility specifier of f() so that it can be called from derived contracts as well. 
Do not set it as being public.
Create a new contract that derives from A and call f() from the new contract.
*/

contract A{
    int public x = 10;

    function f() internal view returns(int){
        return x;
    }
}

contract B is A{
    int k = f(); //f(): internal function
}
