// SPDX-License-Identifier: GPL-3.0

/*
!!! Mapping is always saved in STORAGE, it is a state variable.
!!! Mappings declared inside functions are "also" saved in STORAGE.

!!! The mappings advantage is that lookup time is constant no matter of size, arrays have linear search time.
!!! A mapping is not iterable! We can't iterate through a mapping using a for loop.

!!! Keys are not saved into the mapping(its hash table data structure) To get a value from
the mapping we provide a key, the key gets passed through a hashing function, that outputs
a predetermined index that returns the corresponding value from the mapping.

!!! If we want the value of an unexisting key, we get a "default value"
*/

pragma solidity ^0.8.7;

contract Auction{
    mapping (address => uint) public bids;  //key: address && value: uint
    
    function bid() payable public{
        bids[msg.sender] = msg.value;  //msg.{} = global variables
    }
}
