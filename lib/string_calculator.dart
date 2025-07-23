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
    
    // Split by comma and sum the numbers
    List<String> numberStrings = numbers.split(',');
    int sum = 0;
    for (String numberString in numberStrings) {
      sum += int.parse(numberString);
    }
    return sum;
  }
}
