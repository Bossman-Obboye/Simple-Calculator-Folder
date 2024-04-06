import 'package:flutter/material.dart';

class Prototype extends StatelessWidget {
  final Color btnColor;
  final double btnSideWidth;
  final String btnContent;
  final double btnContentSize;
  final Color btnContentColor;
  final Function btnOnPressed;

  const Prototype({
    super.key,
    required this.btnContent,
    required this.btnColor,
    this.btnSideWidth = 1.5,
    required this.btnContentSize,
    required this.btnContentColor,
    required this.btnOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => btnOnPressed(btnContent),
      child: Container(
        height: (size.width - 12) / 4,
        width: (size.width - 12) / 4,
        decoration: BoxDecoration(
          color: btnColor,
          border: Border(
            top: BorderSide(
              color: Colors.black,
              width: btnSideWidth,
            ),
            left: BorderSide(
              color: Colors.black,
              width: btnSideWidth,
            ),
          ),
        ),
        child: Center(
          child: Text(
            btnContent,
            style: TextStyle(
              color: btnContentColor,
              fontSize: btnContentSize,
            ),
          ),
        ),
      ),
    );
  }
}
