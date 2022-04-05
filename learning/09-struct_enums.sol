// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

//ENUMS: enums are one way of creating a "user-defined type" in solidity
//Struct is saved in "STORAGE"
struct Instructor{  //struct declare
    uint age;
    string name;
    address addr;
}

contract Academy{
    // declaring a new enum type
    enum State {Open, Closed, Unknown}
    /*            0      1       2    */
    
    // declaring and initializing a new state variable of type State
    State public academyState = State.Open;


    // declaring a state variable of type Instructor
    Instructor public academyInstructor;

    constructor(uint _age, string memory _name){    //initializing the struct in the constructor
        academyInstructor.age = _age;
        academyInstructor.name = _name;
        academyInstructor.addr = msg.sender;  //msg.sender = the address that deploys the contract
    }

    //changing a struct state variable
    function changeInstructor(uint _age, string memory _name, address _addr) public{
        if(academyState == State.Open){
            Instructor memory myInstructor = Instructor({
                age: _age,
                name: _name,
                addr: _addr
            });
            academyInstructor = myInstructor;
        }
    }
}
