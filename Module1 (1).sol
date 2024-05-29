// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SchoolGrades {
    mapping(uint256 => uint8) public grades;
    address public teacher;

    constructor() {
        teacher = msg.sender;
    }

    modifier onlyTeacher() {
        require(msg.sender == teacher, "Only the teacher can perform this action");
        _;
    }

    function setGrade(uint256 studentId, uint8 grade) external onlyTeacher {
        require(studentId != 0, "Student ID cannot be zero");
        require(grade <= 100, "Grade must be between 0 and 100");

        if (grades[studentId] == grade) {
            revert("Grade is already set");
        }

        grades[studentId] = grade;
        assert(grades[studentId] == grade);
    }

    function viewGrade(uint256 studentId) external view returns (uint8) {
        require(studentId != 0, "Student ID cannot be zero");
        require(grades[studentId] != 0, "Grade is not set for this student");
        return grades[studentId];
    }
}
