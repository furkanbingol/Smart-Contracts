// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

/*
ADDRESS is a variable type in solidity.There are 2 types of address;
-->plain(non-payable)
-->payable

An address has the following members;
## balance
## transfer(): should be used in most cases as it's the safest way to send ETH
## send():     is like a low-lewel transfer(). If execution fails the contract will
not stop and send() will return false.
## call()
## callcode()
## delegatecall()
## staticcall()

!! transfer() and send() are available only for "payable addresses"
*/

/*
> A smart contract can have an ETH balance, just like an EOA(externally owned account).
> A contract receiving ETH must have "at least one payable function"
The contract receives ETH in multiple ways;
1) Simply by sending eth to the contract address by an EOA account. In this case
the contract needs at least a function called "receive()" or a "fallback()".
2) By calling a payable function and sending eth with that transaction.

!! The ETH balance of the contract is in possession of anyone who can call the transfer() function of the address.
*/

contract Deposit{
    address public owner;
    constructor(){
        owner = msg.sender;
    }

    //A contract can receive ETH only if there's a payable function[receive() or fallback()]
    receive() external payable{
    }

    fallback() external payable{
    }
    // It's not necessary to have both functions. receive() is enough in most cases.


    function getBalance() public view returns(uint)
    {
        return address(this).balance;
    }

    // ether can be send and received by the contract in the trasaction that calls this function as well
    function sendEther() public payable{
    }

    function transferEther(address payable recipient, uint amount) public returns(bool)
    {
        require(owner == msg.sender, "Transfer failed, you are not the owner!");  //it is okay:  require(owner == msg.sender);
        /* 
        checking that only contract OWNER can send ether from the contract to another address
        require:  returns TRUE or FALSE(boolean)
        if it returns true, the function execution continuous with the rest of its body.
        if it return false, transaction fails and transferEther() function will not work 
        */
        
        if(amount <= getBalance()){
            recipient.transfer(amount);   //transfer: member of address data type (sending eth)
            return true;
        }
        else{
            return false;
        }
    }
}
