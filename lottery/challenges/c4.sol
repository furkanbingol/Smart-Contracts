// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

//Change the contract so that the manager receives a fee of 10% of the lottery funds.

contract Lottery{                       
    address payable[] public players;
    address payable public manager;     //manager should to be payable OR we can use: payable(manager).transfer(amount)

    constructor(){
        manager = payable(msg.sender);
    }

    receive() external payable{
        require(msg.value == 0.1 ether);    
        players.push(payable(msg.sender));  
    }

    function getBalance() public view returns(uint){ 
        require(msg.sender == manager);
        return address(this).balance;
    }

    function random() private view returns(uint){
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players.length)));
    }

    function pickWinner() public{
        require(msg.sender == manager);
        require(players.length >= 3);

        uint r = random();
        uint index = r % players.length;
        address payable winner;

        winner = players[index];

        manager.transfer(getBalance() / 10);      // %10 fee
        winner.transfer(getBalance());

        players = new address payable[](0);
    }
}
