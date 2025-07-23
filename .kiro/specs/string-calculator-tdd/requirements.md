# Requirements Document

## Introduction

The String Calculator is a utility class that performs addition operations on numbers provided as strings with various delimiter formats. This implementation follows Test-Driven Development (TDD) principles, building functionality incrementally through the Red-Green-Refactor cycle. The calculator supports multiple input formats including comma-separated values, newline delimiters, custom delimiters, and handles edge cases like negative numbers and large values.

## Requirements

### Requirement 1

**User Story:** As a developer, I want to add numbers from an empty string, so that I can handle edge cases gracefully.

#### Acceptance Criteria

1. WHEN an empty string is provided THEN the calculator SHALL return 0
2. WHEN a null input is provided THEN the calculator SHALL return 0

### Requirement 2

**User Story:** As a developer, I want to add a single number from a string, so that I can process basic numeric input.

#### Acceptance Criteria

1. WHEN a string containing a single number is provided THEN the calculator SHALL return that number as an integer
2. WHEN the string is "1" THEN the calculator SHALL return 1
3. WHEN the string contains whitespace around the number THEN the calculator SHALL handle it gracefully

### Requirement 3

**User Story:** As a developer, I want to add two comma-separated numbers, so that I can perform basic addition operations.

#### Acceptance Criteria

1. WHEN a string contains two numbers separated by a comma THEN the calculator SHALL return their sum
2. WHEN the string is "1,2" THEN the calculator SHALL return 3
3. WHEN the string is "5,10" THEN the calculator SHALL return 15

### Requirement 4

**User Story:** As a developer, I want to add multiple comma-separated numbers, so that I can handle unlimited amounts of input.

#### Acceptance Criteria

1. WHEN a string contains multiple numbers separated by commas THEN the calculator SHALL return their sum
2. WHEN the string is "1,2,3,4,5" THEN the calculator SHALL return 15
3. WHEN the string contains any number of comma-separated values THEN the calculator SHALL process all of them

### Requirement 5

**User Story:** As a developer, I want to use newlines as delimiters, so that I can support alternative input formats.

#### Acceptance Criteria

1. WHEN a string contains numbers separated by newlines THEN the calculator SHALL return their sum
2. WHEN the string is "1\n2" THEN the calculator SHALL return 3
3. WHEN the string contains mixed comma and newline delimiters THEN the calculator SHALL handle both formats
4. WHEN the string is "1\n,2,3\n4,5" THEN the calculator SHALL return 15

### Requirement 6

**User Story:** As a developer, I want to define custom delimiters, so that I can support flexible input formats.

#### Acceptance Criteria

1. WHEN a string starts with "//" followed by a delimiter and newline THEN the calculator SHALL use that custom delimiter
2. WHEN the string is "//;\n1;2" THEN the calculator SHALL return 3
3. WHEN a custom delimiter is defined THEN the calculator SHALL use only that delimiter for parsing

### Requirement 7

**User Story:** As a developer, I want the calculator to reject negative numbers, so that I can enforce business rules about valid input.

#### Acceptance Criteria

1. WHEN a string contains negative numbers THEN the calculator SHALL throw an exception
2. WHEN the string contains a single negative number THEN the exception message SHALL include "Negatives not allowed: [number]"
3. WHEN the string contains multiple negative numbers THEN the exception message SHALL list all negative numbers
4. WHEN the string is "-1,5,-10,-20" THEN the exception SHALL show "Negatives not allowed: -1, -10, -20"

### Requirement 8

**User Story:** As a developer, I want to ignore numbers greater than 1000, so that I can filter out invalid large values.

#### Acceptance Criteria

1. WHEN a string contains numbers greater than 1000 THEN the calculator SHALL ignore those numbers
2. WHEN the string is "2,1001,5" THEN the calculator SHALL return 7
3. WHEN all numbers are greater than 1000 THEN the calculator SHALL return 0

### Requirement 9

**User Story:** As a developer, I want to support variable-length custom delimiters, so that I can handle complex delimiter patterns.

#### Acceptance Criteria

1. WHEN a custom delimiter is enclosed in square brackets THEN the calculator SHALL support delimiters of any length
2. WHEN the string is "//[***]\n1***2***3" THEN the calculator SHALL return 6
3. WHEN the delimiter contains multiple characters THEN the calculator SHALL treat the entire sequence as one delimiter

### Requirement 10

**User Story:** As a developer, I want to support multiple different custom delimiters, so that I can handle complex input formats with various separators.

#### Acceptance Criteria

1. WHEN multiple custom delimiters are defined in square brackets THEN the calculator SHALL support all of them
2. WHEN the string is "//[*][%]\n1*2%3" THEN the calculator SHALL return 6
3. WHEN multiple delimiters are used in the same input THEN the calculator SHALL parse using any of the defined delimiters