/**
 * @author vancityAyush
 * Created on: July 24, 2025
 * String Calculator TDD implementation in Dart
 * Main StringCalculator class
 */

/**
 * Custom exception thrown when negative numbers are encountered.
 */
class NegativeNumberException implements Exception {
  final String message;

  NegativeNumberException(this.message);

  @override
  String toString() => message;
}

class StringCalculator {
  static const String _delimiter = r'[^0-9-]';

  /**
   * Add numbers present in input string
   *
   * @param numbers
   * @return sum of numbers
   */
  int add(String numbers) {
    List<String> nums = numbers.split(RegExp(_delimiter));
    int sum = 0;

    for (String num in nums) {
      try {
        int intNum = int.parse(num);
        if (intNum < 0) {
          throw NegativeNumberException(
            'Negatives not allowed: ${_getNegative(nums)}',
          );
        } else if (intNum > 1000) {
          continue;
        } else {
          sum += intNum;
        }
      } on FormatException {
        continue;
      }
    }

    return sum;
  }

  /**
   * @param nums
   * @return String of negative numbers
   */
  String _getNegative(List<String> nums) {
    List<String> negatives = [];
    for (String num in nums) {
      try {
        if (int.parse(num) < 0) {
          negatives.add(num);
        }
      } on FormatException {
        continue;
      }
    }
    return negatives.join(', ');
  }
}
