// import 'dart:html';

// import 'dart:html';

import 'package:calc/widgets/calc_button.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class YouCalculator extends StatefulWidget {
  const YouCalculator({super.key});

  @override
  State<YouCalculator> createState() => _YouCalculatorState();
}

class _YouCalculatorState extends State<YouCalculator> {
  int firstNum = 0;
  int secondNum = 0;
  String history = '';
  String textToDisplay = '';
  String result = '';
  String operation = '';

   bntOnClick(String buttonValue) {
    print(buttonValue);
    if (buttonValue == 'C') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      result = '';
    } else if (buttonValue == "AC") {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      result = '';
      history = '';
    } else if (buttonValue == "+/-") {
      if (textToDisplay[0] != '-') {
        result = '-$textToDisplay';
      } else {
        result = textToDisplay.substring(1);
      }
    } else if (buttonValue == 'DEL') {
      if (result != '') {
        result = textToDisplay.substring(0, textToDisplay.length - 1);
      }
    } else if (buttonValue == '-' ||
        buttonValue == '+' ||
        buttonValue == 'x' ||
        buttonValue == '/') {
      firstNum = int.parse(textToDisplay);
      result = '';
      operation = buttonValue;
    } else if (buttonValue == '=') {
      secondNum = int.parse(textToDisplay);
      if (operation == '+') {
        result = (firstNum + secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '-') {
        result = (firstNum - secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == 'x') {
        result = (firstNum * secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '/') {
        result = (firstNum / secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
    } else {
      result = int.parse(textToDisplay + buttonValue).toString();
    }
    setState(() {
      textToDisplay = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Align(
            alignment: const Alignment(0.85, 0),
            child: Text(
              history,
              style: const TextStyle(
                color: Color.fromRGBO(0, 0, 0, 0.493),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0.85, 0),
            child: Text(
              result,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalcButton(
                buttonText: "AC",
                fillColor: const Color.fromARGB(162, 1, 30, 54),
                textColor: Colors.white,
                textSize: 20,
                callBack: bntOnClick,
              ),
              CalcButton(
                buttonText: "C",
                fillColor: Colors.blue[100],
                textColor: Colors.black,
                textSize: 25,
                callBack: bntOnClick,
              ),
              CalcButton(
                buttonText: "DEL",
                fillColor: const Color.fromARGB(160, 236, 147, 12),
                textColor: Colors.black,
                textSize: 25,
                callBack: bntOnClick,
              ),
              CalcButton(
                buttonText: "/",
                fillColor: const Color.fromARGB(160, 236, 147, 12),
                textColor: Colors.black,
                textSize: 25,
                callBack: bntOnClick,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalcButton(
                buttonText: "9",
                fillColor: Colors.blue[100],
                textColor: Colors.black,
                textSize: 25,
                callBack: bntOnClick,
              ),
              CalcButton(
                buttonText: "8",
                fillColor: Colors.blue[100],
                textColor: Colors.black,
                textSize: 25,
                callBack: bntOnClick,
              ),
              CalcButton(
                buttonText: "7",
                fillColor: Colors.blue[100],
                textColor: Colors.black,
                textSize: 25,
                callBack: bntOnClick,
              ),
              CalcButton(
                buttonText: "x",
                fillColor: const Color.fromARGB(160, 236, 147, 12),
                textColor: Colors.black,
                textSize: 25,
                callBack: bntOnClick,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalcButton(
                buttonText: "6",
                fillColor: Colors.blue[100],
                textColor: Colors.black,
                textSize: 25,
                callBack: bntOnClick,
              ),
              CalcButton(
                buttonText: "5",
                fillColor: Colors.blue[100],
                textColor: Colors.black,
                textSize: 25,
                callBack: bntOnClick,
              ),
              CalcButton(
                buttonText: "4",
                fillColor: Colors.blue[100],
                textColor: Colors.black,
                textSize: 25,
                callBack: bntOnClick,
              ),
              CalcButton(
                buttonText: "-",
                fillColor: const Color.fromARGB(160, 236, 147, 12),
                textColor: Colors.black,
                textSize: 25,
                callBack: bntOnClick,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalcButton(
                buttonText: "3",
                fillColor: Colors.blue[100],
                textColor: Colors.black,
                textSize: 25,
                callBack: bntOnClick,
              ),
              CalcButton(
                buttonText: "2",
                fillColor: Colors.blue[100],
                textColor: Colors.black,
                textSize: 25,
                callBack: bntOnClick,
              ),
              CalcButton(
                buttonText: "1",
                fillColor: Colors.blue[100],
                textColor: Colors.black,
                textSize: 25,
                callBack: bntOnClick,
              ),
              CalcButton(
                buttonText: "+",
                fillColor: const Color.fromARGB(160, 236, 147, 12),
                textColor: Colors.black,
                textSize: 25,
                callBack: bntOnClick,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalcButton(
                buttonText: "+/-",
                fillColor: Colors.blue[100],
                textColor: Colors.black,
                textSize: 25,
                callBack: bntOnClick,
              ),
              CalcButton(
                buttonText: "0",
                fillColor: Colors.blue[100],
                textColor: Colors.black,
                textSize: 25,
                callBack:()=> bntOnClick,
              ),
              CalcButton(
                buttonText: "00",
                fillColor: Colors.blue[100],
                textColor: Colors.black,
                textSize: 25,
                callBack: bntOnClick,
              ),
              CalcButton(
                buttonText: "=",
                fillColor: const Color.fromARGB(160, 236, 147, 12),
                textColor: Colors.black,
                textSize: 25,
                callBack: bntOnClick,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
