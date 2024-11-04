// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// Smart Contract to manage Student Data
contract StudentManagement {

    // Structure to store student details
    struct Student {
        int stud_id;            // Student ID
        string name;            // Student Name
        string department;      // Department Name
    }

    // Array to store multiple Student structures
    Student[] private students;

    // Function to add a new student to the system
    function addStudent(int stud_id, string memory name, string memory department) public {
        Student memory newStudent = Student(stud_id, name, department);  
        students.push(newStudent);  // Add student to the array
    }

    // Function to get student details by their ID
    function getStudent(int stud_id) public view returns (string memory, string memory) {
        for (uint i = 0; i < students.length; i++) {
            if (students[i].stud_id == stud_id) {
                return (students[i].name, students[i].department);  // Return name and department
            }
        }
        return ("Student Not Found", "Department Not Found");  // Default if student ID doesn't exist
    }

    // Fallback function to handle unknown calls
    fallback() external payable {
        students.push(Student(0, "Fallback Student", "Fallback Dept"));  
    }

    // Receive function to accept Ether transfers
    receive() external payable {}

    // Function to check the balance of the contract (optional)
    function getContractBalance() public view returns (uint) {
        return address(this).balance;
    }

    // Function to get the total number of students
    function getStudentCount() public view returns (uint) {
        return students.length;
    }
}







-----------------------------------

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Build the Contract
contract StudentData {
    // Create a structure for student details
    struct Student {
        int ID;
        string fName;
        string lName;
        string course;       // New attribute for course
        int[2] marks;
        uint wallet;         // Wallet balance for each student
    }

    address owner;
    int public stdCount = 0;
    mapping(int => Student) public stdRecords;

    // Modifier to allow only the owner to add records
    modifier onlyOwner {
        require(owner == msg.sender, "Only the owner can add records.");
        _;
    }

    // Constructor to set the contract owner
    constructor() {
        owner = msg.sender;
    }

    // Function to add new student records
    function addNewRecords(int _ID, string memory _fName, string memory _lName, string memory _course, int[2] memory _marks) public onlyOwner {
        // Increase the count by 1
        stdCount += 1;

        // Add the student details to stdRecords mapping
        stdRecords[stdCount] = Student(_ID, _fName, _lName, _course, _marks, 0);  // Initialize wallet balance to 0
    }

    // Function to deposit money into a student's wallet
    function depositMoney(int _stdCount) public payable {
        require(msg.value > 0, "Deposit amount must be greater than 0.");
        require(_stdCount > 0 && _stdCount <= stdCount, "Invalid student ID.");

        // Increase student's wallet balance
        stdRecords[_stdCount].wallet += msg.value;
    }

    // Function to withdraw money from a student's wallet
    function withdrawMoney(int _stdCount, uint amount) public {
        require(_stdCount > 0 && _stdCount <= stdCount, "Invalid student ID.");
        require(stdRecords[_stdCount].wallet >= amount, "Insufficient balance.");

        // Decrease student's wallet balance
        stdRecords[_stdCount].wallet -= amount;

        // Transfer amount to the student's address
        payable(msg.sender).transfer(amount);
    }

    // Function to get student details including wallet balance
    function getStudent(int _stdCount) public view returns (int, string memory, string memory, string memory, int[2] memory, uint) {
        Student memory s = stdRecords[_stdCount];
        return (s.ID, s.fName, s.lName, s.course, s.marks, s.wallet);
    }

    // Receive function to accept Ether transfers
    receive() external payable {}
}

