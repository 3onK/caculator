import 'package:calculator/calculator.dart';

void main(List<String> arg) {
  final calculator = Calculator();

  try {
    var result = calculator.calculate(arg.join(' '));
    print(result);
  } catch (e) {
    print('오류 발생: ${e.toString()}');
  }
}
