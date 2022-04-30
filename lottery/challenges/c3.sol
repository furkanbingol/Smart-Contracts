// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

// Change the contract so that anyone can pick the winner and finish the lottery, if there are at least 10 players.

contract Lottery{                       
    address payable[] public players;
    address public manager;

    constructor(){
        manager = msg.sender;
    }

    receive() external payable{
        require(msg.value == 0.1 ether);    
        players.push(payable(msg.sender));  
    }

    function getBalance() public view returns(uint){ 
        //require(msg.sender == manager);
        return address(this).balance;
    }

    function random() private view returns(uint){
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players.length)));
    }

    function pickWinner() public{
        //require(msg.sender == manager);    //anyone can pick the winner
        require(players.length >= 10);        

        uint r = random();
        uint index = r % players.length;
        address payable winner;

        winner = players[index];
        winner.transfer(getBalance());

        players = new address payable[](0);  // resetting the lottery for the next round
    }
}
