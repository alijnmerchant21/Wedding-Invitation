pragma solidity ^0.4.19;
contract Marriage {
// Owner address
    address public owner;
// Marriage contract details
    string public leftName;
    string public rightName;
    string public inviteeName;
    uint public marriageDate;    

    constructor(address _owner, string _leftName, string _rightName, string _inviteeName, uint _date) public {
        owner = _owner;
        leftName = _leftName;
        rightName = _rightName;
        inviteeName = _inviteeName;
        marriageDate = _date; 
    }
}

// ringBell is a payable function that allows people to celebrate the couple's marriage by sending Ethers to the wedding invitation
function ringBell() public payable {
    require(msg.value > .0001 ether);
}


modifier onlyOwner() {
    require(msg.sender == owner);
    _;
}
// To use a modifier, append it to the end of the function name
function collect() external onlyOwner {
    owner.transfer(address(this).balance);
}

// Allow only owners the check the balance of the contract
function getBalance() public view onlyOwner returns (uint) {
    return address(this).balance;
}
