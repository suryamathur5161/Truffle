// SPDX-License-Identifier: MIT
pragma solidity^0.8.10;

contract Greeter
{
    event Hello(address sender, uint256 value);
    function greet() public payable
    {
        emit Hello(msg.sender,msg.value);
    } 
}
