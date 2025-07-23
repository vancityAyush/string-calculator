import 'package:string_calculator/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  group('StringCalculator', () {
    late StringCalculator calculator;

    setUp(() {
      calculator = StringCalculator();
    });

    // Tests will be added incrementally through TDD cycles
    // Starting with the most basic functionality
    
    group('Basic Operations', () {
      // Test cases will be added in subsequent TDD cycles
      
      test('StringCalculator can be instantiated', () {
        expect(calculator, isA<StringCalculator>());
      });

      test('empty string returns zero', () {
        expect(calculator.add(''), equals(0));
      });

      test('single number returns value', () {
        expect(calculator.add('1'), equals(1));
      });

      test('two comma separated numbers return sum', () {
        expect(calculator.add('1,2'), equals(3));
      });

      test('multiple comma separated numbers return sum', () {
        expect(calculator.add('1,2,3,4,5'), equals(15));
      });
    });

    group('Delimiter Support', () {
      // Test cases will be added in subsequent TDD cycles
      
      test('newline delimiters work', () {
        expect(calculator.add('1\n2'), equals(3));
      });

      test('mixed delimiters work', () {
        expect(calculator.add('1\n,2,3\n4,5'), equals(15));
      });

      test('custom delimiters work', () {
        expect(calculator.add('//;\n1;2'), equals(3));
      });
    });

    group('Input Validation', () {
      // Test cases will be added in subsequent TDD cycles
      
      test('negative numbers throw exception', () {
        expect(() => calculator.add('-1'), 
               throwsA(isA<NegativeNumberException>()));
      });

      test('negative number exception contains correct message', () {
        try {
          calculator.add('-1');
          fail('Expected NegativeNumberException to be thrown');
        } catch (e) {
          expect(e.toString(), contains('Negatives not allowed: -1'));
        }
      });

      test('multiple negative numbers exception shows all negatives', () {
        try {
          calculator.add('-1,5,-10,-20');
          fail('Expected NegativeNumberException to be thrown');
        } catch (e) {
          expect(e.toString(), equals('Negatives not allowed: -1, -10, -20'));
        }
      });
    });

    group('Edge Cases', () {
      // Test cases will be added in subsequent TDD cycles
    });
  });
}
