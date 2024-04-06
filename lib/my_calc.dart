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
  "/",
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
  "+/-",
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
                    case 16:
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
                   btnOnPressed: callMe,
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
  callMe(String btnValue) {
    setState(() {
  switch (btnValue) {
    case "AC":
      history = "";
      ans = '';
      inputs = '';
      break;
    case "Del":
      if (inputs.isNotEmpty) {
        inputs = inputs.substring(0, inputs.length - 1);
      }
      break;

    case "=":
      ans = evaluateInputs(inputs);
      break;
    default:
      inputs += btnValue;
  }

});
  // print("Inputs: $inputs");
}
}

  

String evaluateInputs(String inputs) {
  Parser p = Parser();
  ContextModel cm = ContextModel();

  try {
    Expression exp = p.parse(inputs);

    double result = exp.evaluate(EvaluationType.REAL, cm);

    return result.toString();
  } catch (e) {
    return "Error";
  }
  
}
