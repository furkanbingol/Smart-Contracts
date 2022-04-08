// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;
/*
Add a function so that the contract can receive ETH by sending it directly to the contract address.
Return the contract’s balance.
Deploy and test the contract on Rinkeby Testnet.
*/

contract Deposit{
    receive() external payable{}

    function contractBalance() public view returns(uint){
        return address(this).balance;
    }
}
