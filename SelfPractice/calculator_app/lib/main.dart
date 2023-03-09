import 'package:calculator_app/CircleButton.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev_log;

import 'package:math_expressions/math_expressions.dart';

import 'ExpandedButton.dart';
void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});
  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String calculateString = "";
  String answer = "";

  void _addNumber(String char){
    setState(() {
      calculateString += char;
    });
  }

  void _clearContent(String char) {
    setState(() {
      calculateString = "";
      answer = "";
    });
  }

  void _giveAnswer(String char) {
    setState(() {
      //Hơi lười nên chơi bằng thư viện hehe
      try{
        Parser p = Parser();
        Expression exp = p.parse(calculateString);
        ContextModel cm = ContextModel();
        answer = '${exp.evaluate(EvaluationType.REAL, cm)}';
      }catch(e){
        if(calculateString != "") {
          answer = "Error";
        } else {
          answer = "";
        }
      }
      //calculateString = "";
    });
  }

  void _setNegative(String char) {
    setState(() {
      if(answer[0].toString() == '-') {
        answer = answer.substring(1);
      } else {
        answer = "-$answer";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(width: 3.0),
                      ),
                      width: constraints.maxWidth,
                      height: 210,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(calculateString,
                              style: const TextStyle(
                                fontSize: 30.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(answer,
                              style: const TextStyle(
                              fontSize: 40.0
                            ),),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              _buildButtonView()
            ]
          );
        }),
    );
  }

  Widget _buildButtonView() {
    return Column(
        children: <Widget>[
          Row(
            children: [
              ButtonCircle(
                buttonContent: "C",
                buttonColor: Colors.grey,
                clickEvent: _clearContent,
              ),
              ButtonCircle(
                  buttonContent: "+/-",
                  buttonColor: Colors.grey,
                  clickEvent: _setNegative,
              ),
              ButtonCircle(
                  buttonContent: "%",
                  buttonColor: Colors.grey,
                clickEvent: _addNumber,
              ),
              ButtonCircle(
                  buttonContent: "/",
                  buttonColor: Colors.orange,
                clickEvent: _addNumber,
              ),
            ],
          ),
          Row(
            children: [
              ButtonCircle(
                  buttonContent: "7",
                  buttonColor: Colors.black54,
                  clickEvent: _addNumber,
              ),
              ButtonCircle(
                  buttonContent: "8",
                  buttonColor: Colors.black54,
                  clickEvent: _addNumber,
              ),
              ButtonCircle(
                  buttonContent: "9",
                  buttonColor: Colors.black54,
                  clickEvent: _addNumber,
              ),
              ButtonCircle(
                  buttonContent: "*",
                  buttonColor: Colors.orange,
                  clickEvent: _addNumber,
              ),
            ],
          ),
          Row(
            children: [
              ButtonCircle(
                  buttonContent: "4",
                  buttonColor: Colors.black54,
                  clickEvent: _addNumber,
              ),
              ButtonCircle(
                  buttonContent: "5",
                  buttonColor: Colors.black54,
                clickEvent: _addNumber,
              ),
              ButtonCircle(
                  buttonContent: "6",
                  buttonColor: Colors.black54,
                clickEvent: _addNumber,
              ),
              ButtonCircle(
                  buttonContent: "-",
                  buttonColor: Colors.orange,
                clickEvent: _addNumber,
              ),
            ],
          ),
          Row(
            children: [
              ButtonCircle(
                  buttonContent: "1",
                  buttonColor: Colors.black54,
                clickEvent: _addNumber,
              ),
              ButtonCircle(
                  buttonContent: "2",
                  buttonColor: Colors.black54,
                clickEvent: _addNumber,
              ),
              ButtonCircle(
                  buttonContent: "3",
                  buttonColor: Colors.black54,
                clickEvent: _addNumber,
              ),
              ButtonCircle(
                  buttonContent: "+",
                  buttonColor: Colors.orange,
                clickEvent: _addNumber,
              ),
            ],
          ),
          Row(
            children: [
              ButtonExpanded(
                  buttonContent: "0",
                  buttonColor: Colors.black54,
                  clickEvent: _addNumber,
              ),
              ButtonCircle(
                  buttonContent: ".",
                  buttonColor: Colors.black54,
                clickEvent: _addNumber,
              ),
              ButtonCircle(
                  buttonContent: "=",
                  buttonColor: Colors.orange,
                clickEvent: _giveAnswer,
              ),
            ],
          ),
        ]
    );
  }
}