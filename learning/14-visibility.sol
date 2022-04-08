// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

/*
There are "four" types of visibility specifiers for 'functions' and 'state variables';

1) Public:
The function is part of the contract interface and can be called both "internally" and externally".
(internally = from within the same contract ---- externally = from other contracts or by EOA accounts)
!!This is the "DEFAULT FOR FUNCTIONS"!!
"GETTER" is automatically created for public variables. They can be easily accessed from dApps. 

2) Private:
private functions and variables are avaliable only in the contract they are defined in.
(not in other contracts: derived or underived). Private is a subset of Internal.
!!They can be accessed in the current contract "ONLY BY A GETTER FUNCTION"

3) Internal:
functions are accessible only from the contract they are defined in and from DERIVED CONTRACTS(inheritance).
!!This is the "DEFAULT FOR STATE VARIABLES"!! 
They can be accessed in the current and derived contracts

4) External:
the function is part of the contract interface, can be accessed only from other contracts or by EOA accounts
using transactions. It's automatically PUBLIC.
!!NOT-AVAILABLE FOR STATE VARIABLES!!

*/

/*
public - all can access

external - Cannot be accessed internally, only externally

internal - only this contract and contracts deriving from it can access

private - can be accessed only from this contract
*/

contract A{
    int public x = 10;    //"public" state variable
    int y = 20;           //"internal" state variable(by default)
    //getter function automatically created only for PUBLIC
    //if we want to access the value of the "internal variable", we need a getter function

    function get_y() public view returns(int){
        return y;
    }

    function f1() private view returns(int){  //we can't see this function in Remix(because of "private")
        return x;  
    }

    function f2() public view returns(int){
        int a;
        a = f1();   //we can call private function(f1) from another public function(f2)
        return a;
    }

    function f3() internal view returns(int){
        return x;
    }

    function f4() external view returns(int){  //external functions "more efficient" than public functions(gas consumption)
        return x;
    }

    //View function declares that (no state variable will be changed).
    //Pure function declares that (no state variable will be changed) or (read).
    function f5() public pure returns(int){
        int b;
        //b = f4();    !!ERROR  -external functions can be accessed ONLY FROM OTHER CONTRACT OR BY EOA accounts
        return b;
    }

}

//DERIVED CONTRACT(inheritance)
contract B is A{  
    int public xx = f3();  //f3 is internal function
    //int public yy = f1() ;  !!ERROR -f1() is private function-

    /*
    --INTERNAL vs PRIVATE--
    Derived contract CAN CALL an internal function. However, derived contract CANNOT CALL a private function
    */
}

contract C{
    A public contract_a = new A();     //this is a contract that deploys another contract.(contract C deploys contract A)
    int public xxx = contract_a.f4();  //f4() is external function
    
    //int public yyy = contract_a.f1();   !!ERROR, f1() private function
    //int public zzz = contract_a.f3();   !!ERROR, f3() internal function(accessible from only DERIVED contracts)
}
