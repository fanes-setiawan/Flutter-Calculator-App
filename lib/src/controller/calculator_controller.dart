class CalculatorController {
  void Function(void Function()) setState;
  CalculatorController({required this.setState});

  String inputNumber = '0';
  String? firstInput;
  String? operation;
  String resultsNumber = '0';

  void deleteLastCharacter() {
    if (inputNumber.isNotEmpty) {
      inputNumber = inputNumber.substring(0, inputNumber.length - 1);
      if (inputNumber.isEmpty) {
        inputNumber = '0';
      }
      setState(() {});
    }
  }

  void appendNumber(String number) {
    if (inputNumber == '0') {
      inputNumber = number;
    } else {
      inputNumber += number;
    }
    setState(() {});
  }

  void appendOperation(String op) {
    if (operation == null) {
      firstInput = inputNumber;
      inputNumber = '0';
      print(op);
      operation = op;
    } else {
      calculate();
      operation = op;
    }
    setState(() {});
  }

  void calculate() {
    if (firstInput != null && operation != null) {
      double first = double.parse(firstInput!);
      double second = double.parse(inputNumber);
      double result = 0;

      switch (operation) {
        case '+':
          result = first + second;
          break;
        case '-':
          result = first - second;
          break;
        case 'x':
          result = first * second;
          break;
        case '/':
          result = first / second;
          break;
      }

      resultsNumber = result.toString();
      inputNumber = resultsNumber;
      firstInput = null;
      operation = null;
      setState(() {});
    }
  }

  void clearAll() {
    inputNumber = '0';
    firstInput = null;
    resultsNumber = '0';
    operation = null;
    setState(() {});
  }
}
