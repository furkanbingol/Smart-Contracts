// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;
/*
Consider the solution from the previous challenge.
Add a function that transfers the entire balance of the contract to another address.
Deploy and test the contract on Rinkeby Testnet.
*/

contract Deposit{
    receive() external payable{}

    function contractBalance() public view returns(uint){
        return address(this).balance;
    }

    function transferEntireBalance(address payable recipient) public returns(bool){
        if(0 < contractBalance()){
            recipient.transfer(contractBalance());
            return true;
        }
        else{
            return false;
        }
    }
}
