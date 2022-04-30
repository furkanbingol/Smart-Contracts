// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

//Change the contract so that the manager is automatically added to the lottery, without sending any ether.

contract Lottery{                       
    address payable[] public players;
    address public manager;

    constructor(){
        manager = msg.sender;
        players.push(payable(manager));    // Adding the manager to the lottery
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
        require(players.length >= 4);        // at least 3 players without the manager

        uint r = random();
        uint index = r % players.length;
        address payable winner;

        winner = players[index];
        winner.transfer(getBalance());

        players = new address payable[](0);  // resetting the lottery for the next round
        players.push(payable(manager));      // adding the manager to players array for the next round
    }
}
