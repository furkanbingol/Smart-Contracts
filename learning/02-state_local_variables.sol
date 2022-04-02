// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract Property{
    /*
    in Solidity;
    'default value' of int : 0
    */

    /*
    DATA CAN BE STORED IN:  STORAGE---STACK---MEMORY
    state variable : stored in Contract's Storage[ethereum blockchain] (using GAS)
    local variable(declared in functions) : stored in Stack (not using GAS, it is FREE)

    SPECIAL NOTE: Strings, Arrays, Structs, Mappings (stored in STORAGE, they use GAS 'even they are local variable')
    if we use "memory" keyword, they are be saved in Memory.
    */

    /*
    --REFERENCE TYPES--
    string
    array
    struct
    mapping
    */

    int public price;  //STATE variable
    string constant public location = "London";  //STATE variable && constant: cannot be changed

    //price = 100;   (-ERROR-)this is not permitted in Solidity
    /*
    to change;
    1- using 'constructor'
    2- using a 'setter function'
    3- initializing the variable at declaration
    */

    function f1() public pure returns(int){ //pure: it doesn't touch the Blockchain
        int x = 5; //LOCAL VARIABLE
        string memory s1 = "abc";
        x = x * 2;
        return x;
    }
}
