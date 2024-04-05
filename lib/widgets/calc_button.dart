import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String buttonText;
  final Color? fillColor;
  final Color? textColor;
  final double textSize;
  final Function callBack;

  const CalcButton(
      {super.key,
      required this.buttonText,
      required this.fillColor,
      required this.textColor,
      required this.textSize,
      required this.callBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: SizedBox(
          width: 70,
          height: 70,
          child: FloatingActionButton(
            backgroundColor: fillColor,
            onPressed: callBack(buttonText),
            child: Text(buttonText,
                style: TextStyle(
                  fontSize: textSize,
                  color: textColor,
                )),
          )),
    );
  }
}
