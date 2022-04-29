// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract Lottery{                       
    address payable[] public players;  //only a payable address can receive Ether.
    address public manager;

    constructor(){
        manager = msg.sender;
    }

    /*
    msg.sender is in each transaction the address that generates the transaction.
    So when the contract gets deployed, msg.sender is the address that deploys the contract but once the contract is deployed in each subsequent transaction msg.sender is the address of the account that generated the transaction.
    When someone sends eth to enter the lottery that address is "msg.sender".
    */
    receive() external payable{
        require(msg.value == 0.1 ether);    //100000000000000000 wei = 0.1 eth
        players.push(payable(msg.sender));  //plain address to payable address conversion
    }

    function getBalance() public view returns(uint){ //returning the contract's balance in wei
        require(msg.sender == manager);
        return address(this).balance;   //address(this) means the address of the current contract.
    }

    // helper function that returns a big random integer
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

        //resetting the lottery
        players = new address payable[](0);  //0: size of new dynamic array
    }
}
