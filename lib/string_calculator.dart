/// Custom exception thrown when negative numbers are encountered.
class NegativeNumberException implements Exception {
  final List<int> negativeNumbers;
  final String message;
  
  NegativeNumberException(this.negativeNumbers) 
    : message = 'Negatives not allowed: ${negativeNumbers.join(', ')}';
  
  @override
  String toString() => message;
}

/// A string calculator that performs addition operations on numbers 
/// provided as strings with various delimiter formats.
class StringCalculator {
  /// Main entry point for string calculation.
  /// Returns the sum of numbers in the input string.
  /// Throws NegativeNumberException for negative inputs.
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }
    
    String delimiter = _extractDelimiter(numbers);
    String numbersSection = _extractNumbersSection(numbers);
    
    // Split by the appropriate delimiter and sum any amount of numbers
    List<String> numberStrings;
    if (numbers.startsWith('//')) {
      // Use only the custom delimiter
      numberStrings = numbersSection.split(delimiter);
    } else {
      // Use default delimiters (comma and newline)
      numberStrings = numbersSection.split(RegExp(r'[,\n]'));
    }
    List<int> parsedNumbers = [];
    List<int> negativeNumbers = [];
    
    for (String numberString in numberStrings) {
      if (numberString.isNotEmpty) {
        int number = int.parse(numberString);
        parsedNumbers.add(number);
        if (number < 0) {
          negativeNumbers.add(number);
        }
      }
    }
    
    // Check for negative numbers and throw exception if found
    if (negativeNumbers.isNotEmpty) {
      throw NegativeNumberException(negativeNumbers);
    }
    
    int sum = 0;
    for (int number in parsedNumbers) {
      // Ignore numbers greater than 1000
      if (number <= 1000) {
        sum += number;
      }
    }
    return sum;
  }
  
  /// Extract the delimiter from the input string.
  /// Returns the custom delimiter if present, otherwise returns default delimiter pattern.
  String _extractDelimiter(String input) {
    if (input.startsWith('//')) {
      // Custom delimiter format: //[delimiter]\n[numbers]
      int newlineIndex = input.indexOf('\n');
      if (newlineIndex != -1 && newlineIndex > 2) {
        return input.substring(2, newlineIndex);
      }
    }
    return '[,\n]'; // Default delimiters
  }
  
  /// Extract the numbers section from the input string.
  /// Removes the custom delimiter prefix if present.
  String _extractNumbersSection(String input) {
    if (input.startsWith('//')) {
      int newlineIndex = input.indexOf('\n');
      if (newlineIndex != -1) {
        return input.substring(newlineIndex + 1);
      }
    }
    return input;
  }
}
