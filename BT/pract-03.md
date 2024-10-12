How to Test the Smart Contract
1. Compile and Deploy the Contract
Open Remix IDE.
Paste the updated contract code in a new file (Bank.sol).
Compile the code using Solidity version >= 0.7.0.
Deploy the contract using Injected Web3 to connect MetaMask on a test network (like Goerli).
2. Create an Account
Call the createAccount function with or without an initial Ether deposit.
3. Deposit Money
Call the deposit function and enter the amount in the Value field (e.g., 1 ETH).
4. Withdraw Money
Call the withdraw function with the desired withdrawal amount in Wei.
5. Check Balance
Call the getBalance function to see the current balance.
6. Check if the Account Exists
Call the doesAccountExist function. It will return true or false.