// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

/*
msg: contains information about the account that generates the transaction and 
also about the transaction or call
----- msg.sender:  account address that generates the transaction
----- msg.value :  eth value(wei) sent to this contract
----- msg.data  :  data field from the transaction or call that executed this function

this: the current contract, explicitly convertible to Address.
#example# address(this).balance = returns the contract balance

gasleft() : remaining gas

"block.timestamp" alias for "now" :  returns the Unix epoch
block.number
block.difficulty
block.gaslimit
tx.gasprice :  gas price of the transaction
*/

//we can send eth to an "EOA (person) account" or to a "contract".

contract GlobalVariables{
    address public owner;
    uint public sentValue;

    constructor(){
        owner = msg.sender;
    }

    function changeOwner() public{
        owner = msg.sender;
    }

    //msg.value is the amount of "wei" sent with a message to the contract
    function sendEther() public payable{ //function that RECEIVES ETH must be declared "payable"
        sentValue = msg.value;
    }

    /*
    At the beginning, the contract's balance is zero. Then a user account (in this case the one that deploys it) sends 5000. 
    The balance of the user's account is decreased by 5000 and the balance of the contract's account is increased by 5000.
    Then another user's account sends 2000. The contract's balance is 5000 + 2000 = 7000
    */
    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function howMuchGas() public view returns(uint){
        uint start = gasleft();
        uint j = 1;

        for(uint i = 1; i < 20; ++i)
        {
            j *= i;
        }
        uint end = gasleft();
        return start - end;
    }

    uint public this_moment = block.timestamp;    // the current time as a timestamp (seconds from 01 Jan 1970)
    uint public block_number = block.number;      // the current block number
    uint public difficulty = block.difficulty;    // the block difficulty
    uint public gaslimit = block.gaslimit;        // the block gas limit
}
