// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Inheritance {
    address public owner;
    uint public totalInheritance;
    mapping(address => uint) public heirs;
    address[] public heirsList;

    event InheritanceSet(uint amount);
    event HeirAdded(address heir, uint share);
    event InheritanceDistributed();

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function.");
        _;
    }

    constructor() {
        owner = msg.sender; // เจ้าของสัญญาคือผู้สร้าง
    }

    function setInheritance(uint _amount) public onlyOwner {
        totalInheritance = _amount;
        emit InheritanceSet(_amount);
    }

    function addHeir(address _heir, uint _share) public onlyOwner {
        require(_share > 0, "Share must be greater than zero.");
        require(heirs[_heir] == 0, "Heir already added.");

        heirs[_heir] = _share;
        heirsList.push(_heir);
        emit HeirAdded(_heir, _share);
    }

    function distributeInheritance() public onlyOwner {
        require(totalInheritance > 0, "Total inheritance must be set.");

        for (uint i = 0; i < heirsList.length; i++) {
            address heir = heirsList[i];
            uint share = heirs[heir];
            if (share > 0) {
                uint amount = totalInheritance * share / 100;
                payable(heir).transfer(amount);
            }
        }
        emit InheritanceDistributed();
        totalInheritance = 0; // รีเซ็ตมรดกหลังการแจกจ่าย
    }

    receive() external payable {}
}