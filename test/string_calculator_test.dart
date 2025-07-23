import 'package:string_calculator/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  group('StringCalculator', () {
    late StringCalculator strCalc;

    setUp(() {
      strCalc = StringCalculator();
    });

    test('emptyReturnsZero', () {
      expect(strCalc.add(''), equals(0));
    });

    test('singleReturnsValue', () {
      expect(strCalc.add('1'), equals(1));
    });

    test('twoCommaSeperatedReturnsSum', () {
      expect(strCalc.add('1,2'), equals(3));
    });

    test('nCommaSeperatedReturnsSum', () {
      expect(strCalc.add('1,2,3,4,5'), equals(15));
    });

    test('twoLineSeperatedReturnsSum', () {
      expect(strCalc.add('1\n2'), equals(3));
    });

    test('nLineSeperatedReturnsSum', () {
      expect(strCalc.add('1\n,2,3\n4,5'), equals(15));
    });

    test('twoAnyDelimeterSeperatedReturnsSum', () {
      expect(strCalc.add('//;\n1;2'), equals(3));
    });

    test('nAnyDelimeterSeperatedReturnsSum', () {
      expect(strCalc.add('//;\n1;2;3;4;5'), equals(15));
    });

    test('singleNegativeThrowsException', () {
      expect(
        () => strCalc.add('-1'),
        throwsA(
          isA<NegativeNumberException>().having(
            (e) => e.toString(),
            'message',
            startsWith('Negatives not allowed: -1'),
          ),
        ),
      );
    });

    test('nNegativesThrowsException', () {
      expect(
        () => strCalc.add('-1,5,-10,-20'),
        throwsA(
          isA<NegativeNumberException>().having(
            (e) => e.toString(),
            'message',
            equals('Negatives not allowed: -1, -10, -20'),
          ),
        ),
      );
    });

    test('ignoreGreaterThanThousand', () {
      expect(strCalc.add('2,1001,5'), equals(7));
    });

    test('anyLengthDelimeters', () {
      expect(strCalc.add('//[***]\n1***2***3'), equals(6));
    });

    test('multipleDelimeters', () {
      expect(strCalc.add('//[*][%]\n1*2%3'), equals(6));
    });
  });
}
