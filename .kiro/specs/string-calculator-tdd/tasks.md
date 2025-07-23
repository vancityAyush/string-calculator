# Implementation Plan

- [x] 1. Set up StringCalculator class structure and basic test framework
  - Create StringCalculator class with add method signature
  - Set up test file structure following Dart testing conventions
  - Ensure proper imports and test runner configuration
  - _Requirements: Foundation for all requirements_

- [x] 2. Implement empty string handling (TDD Cycle 1)
- [x] 2.1 Write failing test for empty string returns zero
  - Add test case that verifies add("") returns 0
  - Run test to confirm it fails (Red phase)
  - Commit changes with message: "test: add test for empty string returns zero"
  - _Requirements: 1.1_

- [x] 2.2 Implement minimal code to pass empty string test
  - Write basic add method that returns 0 for empty string
  - Ensure test passes (Green phase)
  - Commit changes with message: "feat: implement basic add method to pass empty string test"
  - _Requirements: 1.1_

- [x] 3. Implement single number handling (TDD Cycle 2)
- [x] 3.1 Write failing test for single number returns value
  - Add test case that verifies add("1") returns 1
  - Run test to confirm it fails (Red phase)
  - Commit changes with message: "test: add test for single number returns value"
  - _Requirements: 2.1, 2.2_

- [x] 3.2 Implement single number parsing
  - Modify add method to parse and return single numbers
  - Ensure both empty string and single number tests pass (Green phase)
  - Commit changes with message: "feat: implement single number parsing"
  - _Requirements: 2.1, 2.2_

- [x] 4. Implement two comma-separated numbers (TDD Cycle 3)
- [x] 4.1 Write failing test for two comma-separated numbers
  - Add test case that verifies add("1,2") returns 3
  - Run test to confirm it fails (Red phase)
  - Commit changes with message: "test: add test for two comma separated numbers"
  - _Requirements: 3.1, 3.2_

- [x] 4.2 Implement comma-separated number parsing
  - Modify add method to split by comma and sum two numbers
  - Ensure all previous tests still pass (Green phase)
  - Commit changes with message: "feat: implement comma separated numbers parsing"
  - _Requirements: 3.1, 3.2_

- [x] 5. Implement multiple comma-separated numbers (TDD Cycle 4)
- [x] 5.1 Write failing test for multiple comma-separated numbers
  - Add test case that verifies add("1,2,3,4,5") returns 15
  - Run test to confirm it fails (Red phase)
  - Commit changes with message: "test: add test for multiple comma separated numbers"
  - _Requirements: 4.1, 4.2, 4.3_

- [x] 5.2 Implement unlimited number handling
  - Enhance add method to handle any amount of comma-separated numbers
  - Ensure all previous tests still pass (Green phase)
  - Commit changes with message: "feat: handle unlimited numbers"
  - _Requirements: 4.1, 4.2, 4.3_

- [x] 6. Implement newline delimiter support (TDD Cycle 5)
- [x] 6.1 Write failing test for newline delimiters
  - Add test case that verifies add("1\n2") returns 3
  - Run test to confirm it fails (Red phase)
  - Commit changes with message: "test: add test for newline delimiters"
  - _Requirements: 5.1, 5.2_

- [x] 6.2 Implement newline delimiter parsing
  - Modify add method to handle both comma and newline delimiters
  - Ensure all previous tests still pass (Green phase)
  - Commit changes with message: "feat: support newline delimiters"
  - _Requirements: 5.1, 5.2_

- [x] 7. Implement mixed delimiter support (TDD Cycle 6)
- [x] 7.1 Write failing test for mixed delimiters
  - Add test case that verifies add("1\n,2,3\n4,5") returns 15
  - Run test to confirm it fails (Red phase)
  - Commit changes with message: "test: add test for mixed delimiters"
  - _Requirements: 5.3, 5.4_

- [x] 7.2 Implement mixed delimiter handling
  - Enhance delimiter parsing to handle mixed comma and newline formats
  - Ensure all previous tests still pass (Green phase)
  - Commit changes with message: "feat: support mixed comma and newline delimiters"
  - _Requirements: 5.3, 5.4_

- [x] 8. Implement custom delimiter support (TDD Cycle 7)
- [x] 8.1 Write failing test for custom delimiters
  - Add test case that verifies add("//;\n1;2") returns 3
  - Run test to confirm it fails (Red phase)
  - Commit changes with message: "test: add test for custom delimiters"
  - _Requirements: 6.1, 6.2, 6.3_

- [x] 8.2 Implement custom delimiter parsing
  - Add logic to detect and parse custom delimiter format
  - Create helper methods for delimiter extraction and number section parsing
  - Ensure all previous tests still pass (Green phase)
  - Commit changes with message: "feat: support custom delimiters"
  - _Requirements: 6.1, 6.2, 6.3_

- [x] 9. Implement negative number validation (TDD Cycle 8)
- [x] 9.1 Create NegativeNumberException class
  - Implement custom exception class with proper message formatting
  - Include list of negative numbers in exception details
  - _Requirements: 7.1, 7.2_

- [x] 9.2 Write failing test for single negative number exception
  - Add test case that verifies add("-1") throws NegativeNumberException
  - Verify exception message contains "Negatives not allowed: -1"
  - Run test to confirm it fails (Red phase)
  - Commit changes with message: "test: add test for negative numbers exception"
  - _Requirements: 7.1, 7.2_

- [x] 9.3 Implement negative number detection and exception throwing
  - Add validation logic to detect negative numbers
  - Throw NegativeNumberException with appropriate message
  - Ensure all previous positive number tests still pass (Green phase)
  - Commit changes with message: "feat: throw exception for negative numbers"
  - _Requirements: 7.1, 7.2_

- [-] 10. Implement multiple negative number handling (TDD Cycle 9)
- [x] 10.1 Write failing test for multiple negative numbers exception
  - Add test case that verifies add("-1,5,-10,-20") throws exception with all negatives
  - Verify exception message shows "Negatives not allowed: -1, -10, -20"
  - Run test to confirm it fails (Red phase)
  - Commit changes with message: "test: add test for multiple negative numbers exception"
  - _Requirements: 7.3, 7.4_

- [-] 10.2 Enhance exception to show all negative numbers
  - Modify validation logic to collect all negative numbers
  - Update exception message to include all negatives found
  - Ensure all previous tests still pass (Green phase)
  - Commit changes with message: "feat: show all negative numbers in exception"
  - _Requirements: 7.3, 7.4_

- [ ] 11. Implement large number filtering (TDD Cycle 10)
- [ ] 11.1 Write failing test for ignoring numbers greater than 1000
  - Add test case that verifies add("2,1001,5") returns 7
  - Run test to confirm it fails (Red phase)
  - Commit changes with message: "test: add test to ignore numbers greater than 1000"
  - _Requirements: 8.1, 8.2, 8.3_

- [ ] 11.2 Implement large number filtering logic
  - Add logic to ignore numbers greater than 1000 in sum calculation
  - Ensure all previous tests still pass (Green phase)
  - Commit changes with message: "feat: ignore numbers greater than 1000"
  - _Requirements: 8.1, 8.2, 8.3_

- [ ] 12. Implement variable-length custom delimiters (TDD Cycle 11)
- [ ] 12.1 Write failing test for variable-length delimiters
  - Add test case that verifies add("//[***]\n1***2***3") returns 6
  - Run test to confirm it fails (Red phase)
  - Commit changes with message: "test: add test for any length delimiters"
  - _Requirements: 9.1, 9.2, 9.3_

- [ ] 12.2 Implement variable-length delimiter parsing
  - Enhance custom delimiter logic to handle square bracket format
  - Support delimiters of any length within brackets
  - Ensure all previous tests still pass (Green phase)
  - Commit changes with message: "feat: support any length delimiters"
  - _Requirements: 9.1, 9.2, 9.3_

- [ ] 13. Implement multiple custom delimiters (TDD Cycle 12)
- [ ] 13.1 Write failing test for multiple different delimiters
  - Add test case that verifies add("//[*][%]\n1*2%3") returns 6
  - Run test to confirm it fails (Red phase)
  - Commit changes with message: "test: add test for multiple different delimiters"
  - _Requirements: 10.1, 10.2, 10.3_

- [ ] 13.2 Implement multiple custom delimiter support
  - Enhance delimiter parsing to handle multiple bracket-enclosed delimiters
  - Support parsing with any of the defined custom delimiters
  - Ensure all previous tests still pass (Green phase)
  - Commit changes with message: "feat: support multiple different delimiters"
  - _Requirements: 10.1, 10.2, 10.3_

- [ ] 14. Refactor and optimize code structure
- [ ] 14.1 Extract helper methods for better organization
  - Create private methods for delimiter extraction, number parsing, and validation
  - Improve code readability while maintaining all test functionality
  - Commit changes with message: "refactor: improve code structure and add helper methods"
  - _Requirements: Code quality and maintainability_

- [ ] 14.2 Add comprehensive documentation and error handling
  - Add dartdoc comments to public methods and classes
  - Enhance error handling for edge cases and malformed input
  - Ensure robust exception handling throughout the codebase
  - Commit changes with message: "docs: add documentation and improve error handling"
  - _Requirements: Code quality and maintainability_

- [ ] 15. Final validation and edge case testing
- [ ] 15.1 Add comprehensive edge case tests
  - Test whitespace handling, empty delimiter sections, malformed custom delimiters
  - Verify behavior with boundary conditions and unusual input formats
  - _Requirements: Comprehensive validation of all requirements_

- [ ] 15.2 Performance and integration testing
  - Add tests for performance with large input strings
  - Verify integration between all features works correctly
  - Run full test suite to ensure no regressions
  - _Requirements: System reliability and performance_