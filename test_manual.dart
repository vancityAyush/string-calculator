import 'lib/string_calculator.dart';

void main() {
  final calculator = StringCalculator();

  // Test multiple delimiters
  print('Testing multiple delimiters: //[*][%]\\n1*2%3');
  print('Result: ${calculator.add('//[*][%]\n1*2%3')}'); // Should be 6

  // Test with more complex example
  print('Testing multiple delimiters: //[*][%][!]\\n1*2%3!4');
  print('Result: ${calculator.add('//[*][%][!]\n1*2%3!4')}'); // Should be 10

  // Test mixed numbers with filtering
  print('Testing with large numbers: //[*][%]\\n1*1001%3');
  print(
    'Result: ${calculator.add('//[*][%]\n1*1001%3')}',
  ); // Should be 4 (1001 ignored)

  // Test backward compatibility with single delimiter
  print('Testing single delimiter: //[***]\\n1***2***3');
  print('Result: ${calculator.add('//[***]\n1***2***3')}'); // Should be 6
}
