import 'package:calculator/calculator.dart';
import 'package:test/test.dart';

void main() {
  final calculator = Calculator();

  group('Calculator', () {
    test('add', () {
      expect(calculator.calculate("1 + 11"), equals(12.0));
    });

    test('subtract', () {
      expect(calculator.calculate("7 - 1"), equals(6.0));
    });

    test('multiply', () {
      expect(calculator.calculate("5 * 9"), equals(45.0));
    });

    test('divide', () {
      expect(calculator.calculate("12 / 3"), equals(4.0));
    });

    test('divide zero', () {
      expect(() => calculator.calculate("1 / 0"), throwsA('0으로 나눌 수 없습니다.'));
    });

    test('double operand', () {
      expect(calculator.calculate("1.1 + 2.2"), equals(3.3));
    });

    test('no thousand separators', () {
      expect(() => calculator.calculate("1,000 + 2.2"),
          throwsA('피연산자는 실수만 입력해주세요.'));
    });

    test('operand ::= [0-9]+[.]?[0-9]*', () {
      expect(
          () => calculator.calculate('가 + 1.1'), throwsA('피연산자는 실수만 입력해주세요.'));
    });
  });
}
