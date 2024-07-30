// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract tips {
    address owner;
    constructor(){
        owner = msg.sender;
        
    }

    //1. put fund in smart contract

    function addtips() payable public  {

    }

    //2. vie balance

    function viewtips() public  view  returns (uint){
        return address(this).balance;
    }

    //3. add user

    //4. remove user

    //5. view user
       
}