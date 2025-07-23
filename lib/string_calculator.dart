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
    
    // Split by comma and newline delimiters and sum any amount of numbers
    List<String> numberStrings = numbers.split(RegExp(r'[,\n]'));
    int sum = 0;
    for (String numberString in numberStrings) {
      if (numberString.isNotEmpty) {
        sum += int.parse(numberString);
      }
    }
    return sum;
  }
}
