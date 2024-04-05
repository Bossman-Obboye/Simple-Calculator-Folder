import 'package:flutter/material.dart';

class MyCalculator extends StatefulWidget {
  const MyCalculator({super.key});

  @override
  State<MyCalculator> createState() => _MyCalculatorState();
}

String history = "";
String ans = '';
String inputs = '';
RegExp nonNum = RegExp(r'[+\-/x()]');
String value = '';
final List<String> btnLabel = [
  "0",
  ".",
  "ans",
  "=",
  "3",
  "2",
  "1",
  "+",
  "6",
  "5",
  "4",
  "-",
  "9",
  "8",
  "7",
  "x",
  "AC",
  "Del",
  "+/-",
  "/"
];

class _MyCalculatorState extends State<MyCalculator> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(172, 94, 93, 93),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(child: Text('Simple Calculator')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            margin: EdgeInsets.symmetric(
              vertical: size.width * 0.04,
            ),
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
            height: size.height * 0.27,
            width: size.width * 0.94,
            child: Wrap(
              alignment: WrapAlignment.end,
              verticalDirection: VerticalDirection.up,
              children: [
                Text(
                  ans,
                  style: const TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  inputs,
                  style: const TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                reverse: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1.15,
                ),
                itemBuilder: (builder, i) {
                  Color fillColor = const Color.fromARGB(216, 255, 255, 255);
                  Color textColor = Colors.black;
                  if (i == 3 ||
                      i == 7 ||
                      i == 11 ||
                      i == 15 ||
                      i == 18 ||
                      i == 19) {
                    fillColor = const Color.fromARGB(132, 202, 197, 191);
                  } else if (i == 16) {
                    fillColor = const Color.fromARGB(209, 226, 128, 128);
                    textColor = Colors.white;
                  }
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: FloatingActionButton(
                        backgroundColor: fillColor,
                        child: Text(
                          btnLabel[i],
                          style: TextStyle(
                            color: textColor,
                            fontSize: 25,
                          ),
                        ),
                        onPressed: () =>
                            setState(() => acceptBtnLabel(btnLabel[i]))
                        // setState(() {});
                        ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

String acceptBtnLabel(String btnLable) {
  // inputs += btnLable;
  switch (btnLable) {
    case 'AC':
      {
        inputs != '' ? inputs = '' : history = '';
        ans = '';
      }
      break;
    case 'Del':
      {
        inputs.isNotEmpty
            ? inputs = inputs.substring(0, inputs.length - 1)
            : {/*Do Nothing*/};
      }
      break;
    case '+/-':
      {
        // Double check...................Testing
        if (inputs.isNotEmpty) {
          inputs[0] == '-' ? inputs = inputs.substring(1) : inputs = '-$inputs';
        }
      }
      break;
    case '+' || '-' || 'x' || '/':
      {
        if (inputs.isNotEmpty) {
          if (inputsEndsWithOperator()) {
            inputs =
                inputs.replaceRange(inputs.length - 1, inputs.length, btnLable);
          } else if (inputs[inputs.length - 1] == '.') {
            inputs += '0$btnLable';
          } else {
            inputs += btnLable;
          }
        }
      }
      break;
    case "=":
      {
        if (!inputsEndsWithOperator()) {
          // history = inputs;
          ansHasNonZeroFiguresAfterDot(ans)
              ? inputs = ans
              : inputs = ans.substring(0, ans.lastIndexOf('.'));
        } else if (inputs.isEmpty) {/*Do nothing*/}
      }
    case 'ans':
      {
        if (inputs.isEmpty || inputsEndsWithOperator()) {
          inputs += ans;
        } else {/*Do nothing*/}
      }
    case '.':
      {
        if (inputs.isEmpty || inputsEndsWithOperator()) {
          inputs += '0.';
        } else if (!inputs.split(nonNum).last.contains('.')) {
          inputs += '.';
        }
      }
      break;
    default:
      {
        inputs += btnLable;
      }
  }
  return inputs;
}

bool ansHasNonZeroFiguresAfterDot(String ans) {
  ans = evaluateInputs(inputs);
  return RegExp(r'\.\d*[1-9]').hasMatch(ans);
}

bool inputsEndsWithOperator() {
  return inputs.endsWith('+') ||
      inputs.endsWith('-') ||
      inputs.endsWith('x') ||
      inputs.endsWith('/');
}

bool isOperator(String opt) {
  return opt == '+' || opt == 'x' || opt == '/' || opt == '-';
}

double performOperation(double num1, String operator, double num2) {
  switch (operator) {
    case '+':
      return num1 + num2;
    case '-':
      return num1 - num2;
    case 'x':
      return num1 * num2;
    case '/':
      return num1 / num2;
    default:
      throw ArgumentError("Invalid operator: $operator");
  }
}

String evaluateInputs(String input) {
  // var inputs = acceptBtnLabel(input);

  List<double> numbers = [];
  List<String> operators = [];

  void performOperationsUntilLowerPrecedence(String currentOperator) {
    while (operators.isNotEmpty &&
        operators.last != '(' &&
        ((currentOperator == '+' || currentOperator == '-') &&
            (operators.last == 'x' || operators.last == '/'))) {
      double num2 = numbers.removeLast();
      double num1 = numbers.removeLast();
      String op = operators.removeLast();
      numbers.add(performOperation(num1, op, num2));
    }
  }

  List<String> tokens = inputs.split(nonNum);

  for (var token in tokens) {
    if (token.isNotEmpty) {
      numbers.add(double.parse(token));
    }
  }

  for (var i = 0; i < inputs.length; i++) {
    String ch = inputs[i];
    if (isOperator(ch)) {
      performOperationsUntilLowerPrecedence(ch);
      operators.add(ch);
    } else if (ch == '(') {
      operators.add(ch);
    } else if (ch == ')') {
      while (operators.isNotEmpty && operators.last != '(') {
        double num2 = numbers.removeLast();
        double num1 = numbers.removeLast();
        String op = operators.removeLast();
        numbers.add(performOperation(num1, op, num2));
      }
      operators.removeLast(); // Remove the opening parenthesis
    }
  }

  while (operators.isNotEmpty) {
    double num2 = numbers.removeLast();
    double num1 = numbers.removeLast();
    String op = operators.removeLast();
    numbers.add(performOperation(num1, op, num2));
  }

  ans = numbers.first.toString();

  return ans;
}
