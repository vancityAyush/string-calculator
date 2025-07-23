import 'lib/string_calculator.dart';

void main() {
  var calc = StringCalculator();
  print('Test 1 - 1\\n,2,3\\n4,5: ${calc.add('1\n,2,3\n4,5')}');
  print('Test 2 - ,1\\n2,: ${calc.add(',1\n2,')}');
  print('Test 3 - \\n1,2\\n: ${calc.add('\n1,2\n')}');
}