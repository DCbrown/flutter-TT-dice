import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() => runApp(MaterialApp(
  home: HomePage(),
));

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF2ecc71),
        appBar: AppBar(
          title: Text('Dice'),
          backgroundColor: Color(0xFF27ae60),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: () {
                  /*...*/
                },
                child: Text(
                  "D4 Dice",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: () {
                  Navigator.push(context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) => DicePageD2(),
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(-1.0, 0.0),
                            end: Offset.zero,
                          ).animate(animation),
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: Offset.zero,
                              end:  const Offset(-1.0, 0.0),
                            ).animate(secondaryAnimation),
                            child: child,
                          ),
                        );
                      }
                    )
                  );
                },
                child: Text(
                  "D6 Dice",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: () {
                  /*...*/
                },
                child: Text(
                  "D8 Dice",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: () {
                  /*...*/
                },
                child: Text(
                  "D10 Dice",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: () {
                  /*...*/
                },
                child: Text(
                  "D12 Dice",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: () {
                  /*...*/
                },
                child: Text(
                  "D20 Dice",
                  style: TextStyle(fontSize: 20.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class DicePageD2 extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePageD2> {
  int totalRoll = 0;
  int saveTotalDiceRoll = 0;
  int leftDiceNumber = 1;
  int result = 2;

  void diceRoll() {
    leftDiceNumber = Random().nextInt(6) + 1;
  }

  void saveDiceRoll() {
    totalRoll = leftDiceNumber + totalRoll;
    saveTotalDiceRoll = totalRoll;
  }

  void clearDiceRoll() {
    totalRoll = 0;
    saveTotalDiceRoll = 0;
  }

  void add() {
    totalRoll++;
    saveTotalDiceRoll++;
  }

  void subtract() {
    totalRoll--;
    saveTotalDiceRoll--;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF2ecc71),
        appBar: AppBar(
          title: Text('Dice'),
          backgroundColor: Color(0xFF27ae60),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                          "Save Value: $saveTotalDiceRoll",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                          textAlign: TextAlign.center,

                      ),
                    ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: new RaisedButton(
                        onPressed: () {
                          Navigator.push(context,
                              PageRouteBuilder(
                                  pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
                                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                    return SlideTransition(
                                      position: Tween<Offset>(
                                        begin: const Offset(-1.0, 0.0),
                                        end: Offset.zero,
                                      ).animate(animation),
                                      child: SlideTransition(
                                        position: Tween<Offset>(
                                          begin: Offset.zero,
                                          end:  const Offset(-1.0, 0.0),
                                        ).animate(secondaryAnimation),
                                        child: child,
                                      ),
                                    );
                                  }
                              )
                          );
                        },
                        textColor: Colors.white,
                        color: Color(0xFF27ae60),
                        padding: const EdgeInsets.all(8.0),
                        child: new Text(
                            "Go Back",
                            style: TextStyle(fontSize: 20)
                        ),
                      ),
                  ),

                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Padding(
                        child: Image.asset('Images/d6/$leftDiceNumber.png'),
                        padding: EdgeInsets.all(60),
                      ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new RaisedButton(
                    onPressed: () {
                      setState(() {
                        add();
                      });
                    },
                    textColor: Colors.white,
                    color: Color(0xFF27ae60),
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(
                        "+",
                        style: TextStyle(fontSize: 20)
                    ),
                  ),

                  new RaisedButton(
                    onPressed: () {
                      setState(() {
                        subtract();
                      });
                    },
                    textColor: Colors.white,
                    color: Color(0xFF27ae60),
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(
                        "-",
                        style: TextStyle(fontSize: 20)
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new RaisedButton(
                    onPressed: () {
                      setState(() {
                        saveDiceRoll();
                      });
                    },
                    textColor: Colors.white,
                    color: Color(0xFF27ae60),
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(
                        "Save",
                        style: TextStyle(fontSize: 20)
                    ),
                  ),
                  new RaisedButton(
                    onPressed: () {
                      setState(() {
                        diceRoll();
                      });
                    },
                    textColor: Colors.white,
                    color: Color(0xFF27ae60),
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(
                        "Roll",
                        style: TextStyle(fontSize: 20)
                    ),
                  ),
                  new RaisedButton(
                    onPressed: () {
                      setState(() {
                        clearDiceRoll();
                      });
                    },
                    textColor: Colors.white,
                    color: Color(0xFF27ae60),
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(
                        "Clear",
                        style: TextStyle(fontSize: 20)
                    ),
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
