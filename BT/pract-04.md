How to Deploy and Test
1. Compile and Deploy
Open Remix IDE.
Create a new file (StudentManagement.sol) and paste the above code.
Compile the contract with Solidity version 0.7.x or higher.
Deploy the contract using Injected Web3 to connect MetaMask on a test network like Goerli.
2. Interact with the Contract
Adding a Student:

Call the addStudent() function.
Example input: stud_id: 1, name: "Alice", department: "Computer Science"
Getting a Student by ID:

Call getStudent() with stud_id: 1.
Expected Output: "Alice", "Computer Science"
Fallback Function Trigger:

Call an undefined function or send Ether to the contract address.
This will add the default student.
Check Contract Balance:

Call getContractBalance() to verify the Ether balance.
Sample Input and Output
Adding a Student:

css
Copy code
Input: addStudent(1, "Alice", "Computer Science")
Output: Transaction successful
Retrieving a Student:

css
Copy code
Input: getStudent(1)
Output: "Alice", "Computer Science"
Retrieving Non-Existent Student:

css
Copy code
Input: getStudent(99)
Output: "Student Not Found", "Department Not Found"
Sending Ether to Contract:

Send Ether directly to the contract.
Call getContractBalance() to see the updated balance.
Observing Transaction Fees and Gas Values
After deploying the contract, you can observe the gas fee and transaction cost in the MetaMask pop-up.
Every interaction with the contract (e.g., adding students or retrieving data) will consume gas, which can be monitored under transaction history.