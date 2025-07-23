/**
 * Custom exception thrown when negative numbers are encountered.
 */
class NegativeNumberException implements Exception {
  final String message;

  NegativeNumberException(this.message);

  @override
  String toString() => message;
}
