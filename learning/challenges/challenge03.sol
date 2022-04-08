// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;
/*
Modify the changeTokens() function in such a way that it changes the state variable called tokens.
*/
contract MyTokens{
    string[] public tokens = ['BTC', 'ETH'];

    function changeTokens() public{
        string[] storage t = tokens;
        t[0] = 'VET';
    }
}
