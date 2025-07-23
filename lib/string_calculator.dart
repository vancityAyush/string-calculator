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
    
    // Split by comma - currently only handles up to 2 numbers
    List<String> numberStrings = numbers.split(',');
    
    if (numberStrings.length == 1) {
      return int.parse(numberStrings[0]);
    } else if (numberStrings.length == 2) {
      return int.parse(numberStrings[0]) + int.parse(numberStrings[1]);
    } else {
      // This will cause the test to fail for multiple numbers
      throw UnsupportedError('Only up to 2 numbers supported currently');
    }
  }
}
