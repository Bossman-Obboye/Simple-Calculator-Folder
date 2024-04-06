import 'package:calc/calc.dart';
import 'package:calc/flutter_prototype.dart';
import 'package:calc/my_calc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
    home: MyCalculator(),
    // home: MyCalculator(),
    debugShowCheckedModeBanner: false,
  ));
}

void callMe(String buttonValue) {
  print(buttonValue);
}
