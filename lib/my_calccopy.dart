import 'package:flutter/material.dart';

class MYCalculator2 extends StatefulWidget {
  const MYCalculator2({super.key});

  @override
  State<MYCalculator2> createState() => _MYCalculator2State();
}

class _MYCalculator2State extends State<MYCalculator2> {
  String textDisplayed = "";
  String optSign = "";
  String history = ""; //variable to store the history after calculation
  String ans = ""; // variable to store the value for "ANS"

  final List<String> buttonTxtList = [
    "0", ".", "ANS", "=",
    "3", "2", "1", "+",
    "6", "5", "4", "-",
    "9", "8", "7", "x",
    "AC", "DEL", "+/-", "/"
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(216, 61, 60, 60),
      appBar: AppBar(
        title: const Center(child: Text('Simple Calculator')),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: size.width - 10,
              height: size.height * 0.27,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      textDisplayed,
                      style: const TextStyle(fontSize: 30, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      ans,
                      style: const TextStyle(fontSize: 24, color: Colors.black),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      'History',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              reverse: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: buttonTxtList.length,
              padding: const EdgeInsets.all(5),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.19,
                crossAxisCount: 4,
              ),
              itemBuilder: (context, index) {
                String buttonTxt = buttonTxtList[index];
                Color txtColor = Colors.black;
                Color buttonColor = Colors.white;

                if ([3, 7, 11, 15, 18, 19].contains(index)) {
                  buttonColor = const Color.fromARGB(206, 235, 232, 223);
                } else if (index == 17) {
                  buttonColor = const Color.fromARGB(255, 149, 203, 248);
                } else if (index == 16) {
                  buttonColor = const Color.fromARGB(221, 250, 142, 134);
                  txtColor = Colors.white;
                }

                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: FloatingActionButton(
                    backgroundColor: buttonColor,
                    onPressed: () {
                      // Handle button press
                      handleButtonPress(buttonTxt);
                    },
                    child: Text(
                      buttonTxt,
                      style: TextStyle(fontSize: 22, color: txtColor),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  void handleButtonPress(String buttonTxt) {
    setState(() {
      switch (buttonTxt) {
        case 'AC':
          textDisplayed = '';
          history = '';
          ans = '';
          optSign = '';
          break;
        case 'DEL':
          if (textDisplayed.isNotEmpty) {
            textDisplayed = textDisplayed.substring(0, textDisplayed.length - 1);
          }
          break;
        case '+/-':
          if (textDisplayed.isNotEmpty) {
            textDisplayed = textDisplayed[0] == '-' ? textDisplayed.substring(1) : '-$textDisplayed';
          }
          break;
        case '/':
        case 'x':
        case '-':
        case '+':
          if (textDisplayed.isNotEmpty && !_endsWithOperator()) {
            textDisplayed += buttonTxt;
          }
          break;
        case '=':
          // Perform calculation
          // Your calculation logic here
          break;
        case 'ANS':
          textDisplayed += ans;
          break;
        case '.':
          if (!textDisplayed.contains('.')) {
            textDisplayed += buttonTxt;
          }
          break;
        default:
          textDisplayed += buttonTxt;
      }
    });
  }

  bool _endsWithOperator() {
    return textDisplayed.endsWith('+') ||
        textDisplayed.endsWith('-') ||
        textDisplayed.endsWith('x') ||
        textDisplayed.endsWith('/');
  }
}

