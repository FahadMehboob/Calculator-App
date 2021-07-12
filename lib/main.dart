import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var result = "";
  var textt;
  Widget buildButton(var textt) {
    return Expanded(
      child: MaterialButton(
        color: Colors.cyan,
        padding: EdgeInsets.all(24.0),
        onPressed: () {
          setState(() {
            result += textt;
          });
        },
        child: Text(
          textt,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget aC() {
    return MaterialButton(
      padding: EdgeInsets.all(24.0),
      onPressed: () {
        setState(() {
          result = result.substring(0, result.length - 1);
        });
      },
      color: Colors.amber,
      child: Text(
        "AC",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  output() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      result = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Calculator")),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 60),
                alignment: Alignment.centerRight,
                child: Text(
                  result,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(child: Divider()),
              Column(
                children: [
                  Row(
                    children: [
                      MaterialButton(
                        padding: EdgeInsets.all(24.0),
                        onPressed: () {
                          setState(() {
                            result = "0";
                          });
                        },
                        color: Colors.amber,
                        child: Text(
                          "C",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      aC(),
                      buildButton("/"),
                      buildButton("*"),
                    ],
                  ),
                  Row(
                    children: [
                      buildButton("7"),
                      buildButton("8"),
                      buildButton("9"),
                      buildButton("-"),
                    ],
                  ),
                  Row(
                    children: [
                      buildButton("4"),
                      buildButton("5"),
                      buildButton("6"),
                      buildButton("+"),
                    ],
                  ),
                  Row(
                    children: [
                      buildButton("1"),
                      buildButton("2"),
                      buildButton("3"),
                      buildButton("00"),
                    ],
                  ),
                  Row(
                    children: [
                      buildButton("."),
                      buildButton("0"),
                      MaterialButton(
                        padding: EdgeInsets.all(24.0),
                        onPressed: output,
                        color: Colors.amber,
                        child: Text(
                          "=",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
