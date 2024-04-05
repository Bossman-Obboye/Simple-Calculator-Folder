// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class Calculator extends StatelessWidget {
  Calculator({super.key});
  final List<String> gridChildren = [
    "0 ",
    ".",
    "ANS",
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
    "C",
    "DEL",
    "%",
    "/"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Simple Calculator"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                "Simple Calculator",
                style: TextStyle(fontSize: 30),
              ),
              const Text(
                "Simple Calculator",
                style: TextStyle(fontSize: 20),
              ),
              const Positioned(
                right: 0.2,
                child: Text(
                  "Simple Calculator",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Expanded(
                  child: GridView.builder(
                reverse: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemCount: 20,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      color: Colors.red,
                      child: FloatingActionButton(
                        backgroundColor: Colors.blue[100],
                        onPressed: () {},
                        mini: true,
                        child: Text(
                          gridChildren[index],
                          style: const TextStyle(
                              fontSize: 25, color: Colors.black),
                        ),
                      ),
                    ),
                  );
                }),
              )),
            ],
          ),
        ));
  }
}
