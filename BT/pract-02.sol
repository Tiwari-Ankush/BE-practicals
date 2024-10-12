3.  Write a smart contract on a test network, for Bank account of a customer for following 
operations: 
 Deposit money  
 Withdraw Money 
 Show balance 



code: 
// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0;

// Bank contract for creating accounts, depositing, withdrawing, and checking balances
contract Bank {
    // Mapping to store user balances and existence of accounts
    mapping(address => uint) private userAccount;
    mapping(address => bool) private userExists;

    // Create a new account with an optional initial deposit
    function createAccount() public payable returns (string memory) {
        require(!userExists[msg.sender], "Account already exists!");
        userAccount[msg.sender] = msg.value;  // Initial deposit if any
        userExists[msg.sender] = true;
        return "Account created successfully!";
    }

    // Deposit money into the user's account
    function deposit() public payable returns (string memory) {
        require(userExists[msg.sender], "Account does not exist!");
        require(msg.value > 0, "Deposit amount must be greater than 0");
        userAccount[msg.sender] += msg.value;
        return "Amount deposited successfully!";
    }

    // Withdraw money from the user's account
    function withdraw(uint amount) public returns (string memory) {
        require(userExists[msg.sender], "Account does not exist!");
        require(amount > 0, "Withdrawal amount must be greater than 0");
        require(userAccount[msg.sender] >= amount, "Insufficient balance");

        userAccount[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);  // Transfer Ether back to the user
        return "Amount withdrawn successfully!";
    }

    // View the current balance of the user
    function getBalance() public view returns (uint) {
        require(userExists[msg.sender], "Account does not exist!");
        return userAccount[msg.sender];
    }

    // Check if the user's account exists
    function doesAccountExist() public view returns (bool) {
        return userExists[msg.sender];
    }
}


