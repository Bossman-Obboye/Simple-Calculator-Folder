// import 'dart:js_interop';

// import 'package:calc/dart_prototype.dart';
import 'package:calc/flutter_prototype.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

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
  "AC",
  "Del",
  "( )",
  "÷",
  "9",
  "8",
  "7",
  "x",
  "6",
  "5",
  "4",
  "-",
  "3",
  "2",
  "1",
  "+",
  "00",
  "0",
  ".",
  "="
];

class _MyCalculatorState extends State<MyCalculator> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Center(child: Text('Simple Calculator')),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: size.width,
              height: size.height * 0.24, // Adjust the height as needed
              padding: const EdgeInsets.all(10),
              // Add any widgets you want to appear above the GridView.builder
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
            Expanded(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, childAspectRatio: 1.2),
                itemCount: 20,
                itemBuilder: (context, index) {
                  Color btnContentColor = Colors.black;
                  Color btnColor = Colors.white;
                  double btnContentSize = 25;
                  switch (index) {
                    case 0:
                      {
                        btnColor = const Color.fromARGB(198, 168, 9, 9);
                        btnContentColor = Colors.white;
                        btnContentSize = 28;
                      }
                      break;
                    case 1:
                      {
                        btnContentColor =
                            const Color.fromARGB(199, 201, 16, 16);
                        btnContentSize = 28;
                      }
                      break;
                    case 3:
                    case 7:
                    case 11:
                    case 15:
                      {
                        btnContentColor =
                            const Color.fromARGB(255, 5, 110, 196);
                        btnContentSize = 30;
                      }
                      break;
                    case 19:
                      {
                        btnContentColor = Colors.black;
                        btnContentSize = 30;
                        btnColor = const Color.fromARGB(214, 197, 218, 235);
                      }
                      break;
                    default:
                      {}
                  }

                  return Prototype(
                    btnContent: btnLabel[index],
                    btnColor: btnColor,
                    btnOnPressed: calcLogicFunction,
                    btnContentColor: btnContentColor,
                    btnContentSize: btnContentSize,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // bool ansHasNonZeroFiguresAfterDot(String result) {
  //   ans = evaluateInputs(inputs);
  //   return RegExp(r'\.\d*[1-9]').hasMatch(result);
  // }

  // bool numberHasNonZeroDigitAfterDot(String result) {
  //   RegExp digitsAfterDot = RegExp(r'\.\d*[1-9]');
  //   return digitsAfterDot.hasMatch(result);
  //   // RegExp(r'\.\d*[1-9]').hasMatch(ans);
  // }

  // String rectifyAnswer(String result) {
  //   return ansHasNonZeroFiguresAfterDot(result)
  //       ? result
  //       : result.substring(0, result.lastIndexOf('.'));
  // }

  // String rectifyAnswer(String result) {
  //   return ansHasNonZeroFiguresAfterDot(result)
  //       ? result
  //       : result.substring(0, result.lastIndexOf('.'));
  // }

  bool numberHasNonZeroDigitAfterDot(String number) {
    RegExp digitsAfterDot = RegExp(r'\.\d*[1-9]');
    return digitsAfterDot.hasMatch('$number');
    // RegExp(r'\.\d*[1-9]').hasMatch(ans);
  }

  String rectifyAnswer(String result) {
    return numberHasNonZeroDigitAfterDot(result)
        ? result
        : result.substring(0, result.lastIndexOf('.'));
  }

  calcLogicFunction(String btnValue) {
    setState(
      () {
        switch (btnValue) {
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
          case '00':
            {
              if (inputs.isEmpty ||
                  nonNum.hasMatch(inputs[inputs.length - 1])) {
                /*Send feedBack to the user*/
              } else {
                inputs += '00';
              }
            }
            break;
          case '+':
          case '-':
          case 'x':
          case '÷':
            {
              if (inputs.isNotEmpty) {
                if (CheckInputErrors.inputEndsWithNOnDigit(inputs)) {
                  inputs = inputs.replaceRange(
                      inputs.length - 1, inputs.length, btnValue);
                } else if (inputs[inputs.length - 1] == '.') {
                  inputs += '0$btnValue';
                } else {
                  inputs += btnValue;
                }
              } else {/*Do Nothing*/}
            }
            break;
          case "=":
            {
              if (inputs.isNotEmpty &&
                  CheckInputErrors.inputEndsWithNOnDigit(inputs) == false) {
                ans = rectifyAnswer(evaluateInputs(inputs));
                inputs = "";
              } else {/* Send feedBack to the user*/}
            }
            break;
          case '.':
            {
              if (inputs.isEmpty ||
                  CheckInputErrors.inputEndsWithNOnDigit(inputs)) {
                inputs += '0.';
              } else if (!inputs.split(nonNum).last.contains('.')) {
                inputs += '.';
              }
            }
            break;
          case "( )":
            {
              if (inputs.isEmpty ||
                  (inputs.split("(").length - 1 == 0 &&
                      RegExp(r'[+\-/x.]')
                          .hasMatch(inputs[inputs.length - 1]))) {
                inputs += "(";
              } else if (inputs.split("(").length - 1 == 1 &&
                  RegExp(r'[0-9.]').hasMatch(inputs[inputs.length - 1])) {
                inputs += ")";
              } else if (inputs.lastIndexOf("(") < inputs.lastIndexOf(")") &&
                  RegExp(r'[/+\-x]').hasMatch(inputs[inputs.length - 1])) {
                inputs += '(';
              } else if (inputs.lastIndexOf(")") < inputs.lastIndexOf("(") &&
                  RegExp(r'[0-9.]').hasMatch(inputs[inputs.length - 1])) {
                inputs += ")";
              } else {
                /*Do Nothing or provide feedback to the user*/
              }
            }
            break;
          default:
            {
              inputs += btnValue;
            }
        }
      },
    );
    // print("Inputs: $inputs");
  }
}

String evaluateInputs(String input) {
  String expression1 = inputs.replaceAll('x', '*');
  String expression = expression1.replaceAll('÷', '/');
  Parser p = Parser();
  ContextModel cm = ContextModel();

  try {
    Expression exp = p.parse(expression);

    double result = exp.evaluate(EvaluationType.REAL, cm);

    return result.toString();
  } catch (e) {
    return "Error";
  }
}

class CheckInputErrors {
  static bool inputEndsWithNOnDigit(String inputs) {
    return RegExp((r'[+\-/x(]')).hasMatch(inputs[inputs.length - 1]);
  }

  static bool inputContainsBracketErrors(String inputs) {
    if (inputs.isEmpty) {
      return true;
    } else if (!inputs.contains("(") && !inputs.contains(")")) {
      return false;
    } else if (inputs.contains("(") && !inputs.contains(")") ||
        !inputs.contains("(") && inputs.contains(")")) {
      return true;
    } else {
      return inputs.lastIndexOf(")") < inputs.lastIndexOf("(");
    }
  }
}
