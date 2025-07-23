# String Calculator

A Dart implementation of a string calculator with support for flexible delimiters and input validation.

## Features

- Parse comma-separated numbers: `"1,2,3"` → `6`
- Support newline delimiters: `"1\n2,3"` → `6`
- Custom delimiters: `"//;\n1;2"` → `3`
- Multi-character delimiters: `"//[***]\n1***2"` → `3`
- Multiple delimiters: `"//[*][%]\n1*2%3"` → `6`
- Negative number validation with detailed error messages
- Numbers > 1000 are ignored

## API

```dart
class StringCalculator {
  int add(String numbers);
}

class NegativeNumberException implements Exception {
  final String message;
}
```

## Usage

```dart
import 'package:string_calculator/string_calculator.dart';

final calculator = StringCalculator();

calculator.add("");           // 0
calculator.add("1");          // 1
calculator.add("1,2");        // 3
calculator.add("1\n2,3");     // 6
calculator.add("//;\n1;2");   // 3
calculator.add("2,1001,5");   // 7

// Throws NegativeNumberException: "Negatives not allowed: -1, -3"
calculator.add("-1,2,-3");
```

## Implementation

- **Regex parsing**: Uses `[^0-9-]` pattern for flexible delimiter handling
- **Input validation**: Comprehensive negative number detection
- **Error handling**: Custom exception with detailed error messages
- **Number filtering**: Automatic exclusion of numbers > 1000

## Testing

```bash
dart test                    # Run all tests
dart test --reporter=expanded # Detailed output
```

13 test cases covering all features and edge cases.


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

**Requirements**: Dart SDK >= 2.17.0

## Author

**Ayush** - [vancityAyush](https://github.com/vancityAyush)

Created on: July 24, 2025