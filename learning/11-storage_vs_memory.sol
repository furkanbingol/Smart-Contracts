// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract A {
    string[] public cities = ['Prague','Istanbul'];  //stored in STORAGE

    function f_memory() view public{   //this function doesn't change the blockchain(view or pure)
        string[] memory s1 = cities;   //stored in MEMORY
        //string s2;   ->ERROR! Data location must be "storage", "memory" or "calldata" for variable.
        
        s1[0] = 'Berlin';  //NOT AFFECT the state variable(cities)
    }

    function f_storage() public{
        string[] storage s1 = cities;   //stored in STORAGE
        //string s2;   ->ERROR! Data location must be "storage", "memory" or "calldata" for variable.
        
        s1[0] = 'Berlin';  //AFFECT the state variable(cities)
    }
}
