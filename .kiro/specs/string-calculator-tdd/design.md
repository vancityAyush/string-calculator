# Design Document

## Overview

The String Calculator is implemented as a Dart class following Test-Driven Development (TDD) methodology. The design emphasizes incremental development through the Red-Green-Refactor cycle, building functionality step by step with comprehensive test coverage. The calculator processes string inputs containing numbers with various delimiter formats and returns their sum while enforcing specific business rules.

## Architecture

The system follows a simple, focused architecture with clear separation of concerns:

```
StringCalculator (Main Class)
├── Core Logic (add method)
├── Input Parsing (delimiter detection and parsing)
├── Validation (negative numbers, large numbers)
└── Exception Handling (custom exceptions)

Test Suite
├── Unit Tests (each requirement)
├── Edge Case Tests
└── Exception Tests
```

### Key Design Principles

- **TDD-First**: Every feature is driven by failing tests
- **Single Responsibility**: Each method has one clear purpose  
- **Incremental Development**: Features built step-by-step
- **Comprehensive Validation**: Input validation with clear error messages
- **Extensible Design**: Easy to add new delimiter types

## Components and Interfaces

### StringCalculator Class

The main class that provides the public API for string calculation operations.

```dart
class StringCalculator {
  /// Main entry point for string calculation
  /// Returns the sum of numbers in the input string
  /// Throws NegativeNumberException for negative inputs
  int add(String numbers);
  
  // Private helper methods
  List<String> _parseNumbers(String input);
  String _extractDelimiter(String input);
  String _extractNumbersSection(String input);
  void _validateNumbers(List<int> numbers);
  List<int> _filterValidNumbers(List<int> numbers);
}
```

### Custom Exception Classes

```dart
class NegativeNumberException implements Exception {
  final List<int> negativeNumbers;
  final String message;
  
  NegativeNumberException(this.negativeNumbers) 
    : message = 'Negatives not allowed: ${negativeNumbers.join(', ')}';
  
  @override
  String toString() => message;
}
```

### Input Processing Pipeline

The design follows a clear processing pipeline:

1. **Input Analysis**: Detect delimiter format (default, custom, or multi-delimiter)
2. **Delimiter Extraction**: Extract custom delimiters if present
3. **Number Parsing**: Split input using appropriate delimiters
4. **Validation**: Check for negative numbers and throw exceptions
5. **Filtering**: Remove numbers greater than 1000
6. **Calculation**: Sum the remaining valid numbers

## Data Models

### Input Format Types

The calculator supports multiple input formats:

```dart
enum DelimiterType {
  defaultDelimiters,    // comma and newline
  singleCustom,         // //;\n format
  variableLength,       // //[***]\n format  
  multipleCustom        // //[*][%]\n format
}

class ParsedInput {
  final DelimiterType type;
  final List<String> delimiters;
  final String numbersSection;
  
  ParsedInput(this.type, this.delimiters, this.numbersSection);
}
```

### Number Processing

```dart
class NumberProcessor {
  static const int MAX_VALID_NUMBER = 1000;
  
  static List<int> parseAndValidate(List<String> numberStrings) {
    final numbers = numberStrings
        .where((s) => s.isNotEmpty)
        .map((s) => int.parse(s.trim()))
        .toList();
    
    _checkForNegatives(numbers);
    return _filterLargeNumbers(numbers);
  }
}
```

## Error Handling

### Exception Strategy

The design implements specific exception handling for business rule violations:

- **NegativeNumberException**: Thrown when negative numbers are detected
- **FormatException**: Handled gracefully for invalid number formats
- **ArgumentError**: For malformed delimiter specifications

### Error Messages

Error messages are designed to be informative and actionable:
- Single negative: "Negatives not allowed: -5"
- Multiple negatives: "Negatives not allowed: -1, -10, -20"
- Invalid format: Clear indication of parsing issues

## Testing Strategy

### TDD Implementation Approach

The testing strategy follows strict TDD principles:

1. **Red Phase**: Write failing test for next requirement
2. **Green Phase**: Write minimal code to pass the test
3. **Refactor Phase**: Improve code while maintaining green tests

### Test Categories

```dart
// Basic Functionality Tests
group('Basic Operations', () {
  test('empty string returns zero', () { ... });
  test('single number returns value', () { ... });
  test('two comma separated numbers return sum', () { ... });
});

// Delimiter Tests  
group('Delimiter Support', () {
  test('newline delimiters work', () { ... });
  test('custom delimiters work', () { ... });
  test('variable length delimiters work', () { ... });
});

// Validation Tests
group('Input Validation', () {
  test('negative numbers throw exception', () { ... });
  test('numbers over 1000 are ignored', () { ... });
});

// Edge Cases
group('Edge Cases', () {
  test('mixed delimiters work', () { ... });
  test('multiple custom delimiters work', () { ... });
});
```

### Test Data Strategy

Each test uses specific, predictable data that clearly demonstrates the expected behavior:

- Empty string: `""` → `0`
- Single number: `"1"` → `1`  
- Two numbers: `"1,2"` → `3`
- Custom delimiter: `"//;\n1;2"` → `3`
- Negative handling: `"-1,5,-10"` → Exception with specific message

### Incremental Test Development

Tests are added incrementally, with each test representing one step in the TDD cycle:

1. Start with simplest case (empty string)
2. Add complexity gradually (single number, two numbers, multiple numbers)
3. Introduce delimiter variations (newlines, custom, variable length)
4. Add validation rules (negatives, large numbers)
5. Handle advanced scenarios (multiple delimiters)

### Test Organization

Tests are organized to match the development phases:

- **Phase 1**: Basic number addition (empty, single, multiple)
- **Phase 2**: Delimiter support (newlines, custom formats)  
- **Phase 3**: Validation rules (negatives, large numbers)
- **Phase 4**: Advanced features (variable length, multiple delimiters)

This design ensures that each test builds upon previous functionality while maintaining clear, focused test cases that drive the implementation forward incrementally.