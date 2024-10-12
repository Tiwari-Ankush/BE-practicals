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
