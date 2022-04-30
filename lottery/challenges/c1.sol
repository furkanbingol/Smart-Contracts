// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

//Change the contract so that the manager of the lottery can not participate in the lottery.

contract Lottery{                       
    address payable[] public players;
    address public manager;

    constructor(){
        manager = msg.sender;
    }

    receive() external payable{
        require(msg.sender != manager);     // the manager can not participate in the lottery
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
        winner.transfer(getBalance());

        players = new address payable[](0);
    }
}
