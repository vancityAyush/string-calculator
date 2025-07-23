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

    List<String> delimiters = _extractDelimiters(numbers);
    String numbersSection = _extractNumbersSection(numbers);

    // Split by the appropriate delimiter and sum any amount of numbers
    List<String> numberStrings;
    if (numbers.startsWith('//')) {
      // Use custom delimiters
      numberStrings = _splitByMultipleDelimiters(numbersSection, delimiters);
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

  /// Extract delimiters from the input string.
  /// Returns a list of custom delimiters if present, otherwise returns default delimiters.
  List<String> _extractDelimiters(String input) {
    if (input.startsWith('//')) {
      // Custom delimiter format: //[delimiter1][delimiter2]...\n[numbers] or //delimiter\n[numbers]
      int newlineIndex = input.indexOf('\n');
      if (newlineIndex != -1 && newlineIndex > 2) {
        String delimiterSection = input.substring(2, newlineIndex);

        // Check for multiple bracket format: [delimiter1][delimiter2]...
        if (delimiterSection.contains('[') && delimiterSection.contains(']')) {
          List<String> delimiters = [];
          int currentIndex = 0;

          while (currentIndex < delimiterSection.length) {
            int startBracket = delimiterSection.indexOf('[', currentIndex);
            if (startBracket == -1) break;

            int endBracket = delimiterSection.indexOf(']', startBracket);
            if (endBracket == -1) break;

            String delimiter = delimiterSection.substring(
              startBracket + 1,
              endBracket,
            );
            delimiters.add(delimiter);
            currentIndex = endBracket + 1;
          }

          return delimiters.isNotEmpty ? delimiters : [',', '\n'];
        } else {
          // Single character custom delimiter
          return [delimiterSection];
        }
      }
    }
    return [',', '\n']; // Default delimiters
  }

  /// Split a string by multiple delimiters.
  List<String> _splitByMultipleDelimiters(
    String input,
    List<String> delimiters,
  ) {
    if (delimiters.isEmpty) return [input];

    List<String> result = [input];

    for (String delimiter in delimiters) {
      List<String> newResult = [];
      for (String part in result) {
        newResult.addAll(part.split(delimiter));
      }
      result = newResult;
    }

    return result;
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
