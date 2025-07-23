# String Calculator TDD Kata

A comprehensive implementation of the String Calculator TDD Kata in Dart, following Test-Driven Development (TDD) principles. This project demonstrates software craftsmanship through clean code, comprehensive testing, and incremental development.

## About

This project is an implementation of the [Incubyte TDD Assessment](https://blog.incubyte.co/blog/tdd-assessment/) String Calculator Kata. It showcases:

- **Test-Driven Development (TDD)** methodology with Red-Green-Refactor cycles
- **Clean, readable code** with proper separation of concerns
- **Comprehensive test coverage** with meaningful test cases
- **Incremental feature development** through frequent commits

## Features

The String Calculator supports the following operations:

### ✅ Core Requirements
1. **Basic Addition**: `add("")` returns `0`, `add("1")` returns `1`, `add("1,2")` returns `3`
2. **Multiple Numbers**: Handles any amount of comma-separated numbers
3. **Newline Support**: Supports newlines between numbers (`"1\n2,3"` returns `6`)
4. **Custom Delimiters**: Supports custom delimiters (`"//;\n1;2"` returns `3`)
5. **Negative Number Validation**: Throws exception for negative numbers with detailed message

### ✅ Advanced Features
- **Multiple Negatives**: Shows all negative numbers in exception message
- **Large Number Filtering**: Ignores numbers greater than 1000
- **Any Length Delimiters**: Supports delimiters of any length (`"//[***]\n1***2***3"`)
- **Multiple Delimiters**: Supports multiple different delimiters (`"//[*][%]\n1*2%3"`)

## Project Structure

```
string-calculator/
├── bin/
│   └── string_calculator.dart    # Command-line entry point
├── lib/
│   └── string_calculator.dart    # Main StringCalculator class
├── test/
│   └── string_calculator_test.dart # Comprehensive test suite
├── pubspec.yaml                  # Dart project configuration
└── README.md                     # This file
```

## Usage

### Running the Application

```bash
dart run bin/string_calculator.dart
```

### Using the StringCalculator Class

```dart
import 'package:string_calculator/string_calculator.dart';

void main() {
  final calculator = StringCalculator();
  
  // Basic usage
  print(calculator.add(""));        // Output: 0
  print(calculator.add("1"));       // Output: 1
  print(calculator.add("1,2"));     // Output: 3
  print(calculator.add("1,2,3"));   // Output: 6
  
  // Advanced usage
  print(calculator.add("1\n2,3"));     // Output: 6
  print(calculator.add("//;\n1;2"));   // Output: 3
  print(calculator.add("2,1001,5"));   // Output: 7 (ignores 1001)
  
  // Exception handling
  try {
    calculator.add("-1,2,-3");
  } catch (e) {
    print(e); // Output: Negatives not allowed: -1, -3
  }
}
```

## Running Tests

Execute the comprehensive test suite:

```bash
# Run all tests
dart test

# Run tests with detailed output
dart test --reporter=expanded

# Run tests with coverage (if coverage package is added)
dart test --coverage=coverage
```

### Test Coverage

The project includes 13 comprehensive test cases covering:
- ✅ Empty string handling
- ✅ Single and multiple number parsing
- ✅ Comma and newline delimiters
- ✅ Custom delimiter support
- ✅ Negative number validation
- ✅ Large number filtering
- ✅ Advanced delimiter features

## TDD Development Process

This project was developed using strict TDD methodology:

1. **Red**: Write a failing test
2. **Green**: Write minimal code to make the test pass
3. **Refactor**: Improve the code while keeping tests green

The commit history (28+ commits) demonstrates this process with clear test-first development and incremental feature additions.

## Technical Implementation

### Key Components

- **StringCalculator**: Main class with `add(String numbers)` method
- **NegativeNumberException**: Custom exception for negative number validation
- **Regex-based parsing**: Flexible delimiter handling using pattern matching
- **Error handling**: Robust parsing with format exception handling

### Design Decisions

- Used regex pattern `[^0-9-]` to handle any non-numeric delimiter
- Implemented custom exception for clear error messaging
- Separated negative number detection into helper method for clarity
- Added number filtering (>1000) as separate concern

## Development Setup

### Prerequisites

- [Dart SDK](https://dart.dev/get-dart) (>= 2.17.0)

### Getting Started

1. **Clone the repository**:
   ```bash
   git clone https://github.com/vancityAyush/string-calculator.git
   cd string-calculator
   ```

2. **Install dependencies**:
   ```bash
   dart pub get
   ```

3. **Run tests**:
   ```bash
   dart test
   ```

4. **Run the application**:
   ```bash
   dart run
   ```

## Author

**Ayush** - [vancityAyush](https://github.com/vancityAyush)

Created on: July 24, 2025

## Assessment Completion

This project successfully implements all requirements of the Incubyte TDD Assessment:

- ✅ Hosted on public GitHub repository
- ✅ Follows TDD best practices with frequent commits
- ✅ Implements all required String Calculator features
- ✅ Includes comprehensive test suite
- ✅ Demonstrates clean code principles
- ✅ Shows software craftsmanship through incremental development

**Status**: ✅ **COMPLETE** - All requirements implemented with additional advanced features.
