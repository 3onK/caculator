class Calculator {
  final RegExp operandRegExp = RegExp(r'^[0-9]+(\.[0-9]*)?$');

  double add(double a, double b) {
    return a + b;
  }

  double subtract(double a, double b) {
    return a - b;
  }

  double multiply(double a, double b) {
    return a * b;
  }

  double divide(double a, double b) {
    if (b == 0) {
      throw '0으로 나눌 수 없습니다.';
    }
    return a / b;
  }

  double calculate(String input) {
    var parsedInput = input.split(' ');

    // 3개의 입력값을 제대로 받아오지 못했을 경우 예외처리
    if (parsedInput.length != 3) {
      throw '잘못된 input입니다.\n필요 입력값: <피연산자1> <연산자> <피연산자2>(띄어쓰기에 주의해주세요)';
    }

    // 피연산자가 실수가 아닐 경우 예외처리
    if (!operandRegExp.hasMatch(parsedInput[0]) ||
        !operandRegExp.hasMatch(parsedInput[2])) {
      throw '피연산자는 실수만 입력해주세요.';
    }

    var operand1 = double.parse(parsedInput[0]);
    var operator = parsedInput[1];
    var operand2 = double.parse(parsedInput[2]);

    double result;
    switch (operator) {
      case '+':
        result = add(operand1, operand2);
        break;
      case '-':
        result = subtract(operand1, operand2);
        break;
      case '*':
        result = multiply(operand1, operand2);
        break;
      case '/':
        result = divide(operand1, operand2);
        break;
      default:
        throw '잘못된 연산자입니다.';
    }

    // 부동소수점 연산 오차 해결을 위해 소수점 15자리까지
    return double.parse(result.toStringAsFixed(15));
  }
}
