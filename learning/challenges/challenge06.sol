// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;
/*
Consider the solution from the previous challenge.
Add a new immutable state variable called admin and initialize it with the address of the account that deploys the contract;
Add a restriction so that only the admin can transfer the balance of the contract to another address;
Deploy and test the contract on Rinkeby Testnet.
*/

contract Deposit{
    address public immutable admin;
    receive() external payable{}
    
    constructor(){
        admin = msg.sender;
    }

    function contractBalance() public view returns(uint){
        return address(this).balance;
    }

    function transferEntireBalance(address payable recipient) public returns(bool){
        require(admin == msg.sender,"Transfer failed, you're not the admin");
        if(0 < contractBalance()){
            recipient.transfer(contractBalance());
            return true;
        }
        else{
            return false;
        }
    }
}
