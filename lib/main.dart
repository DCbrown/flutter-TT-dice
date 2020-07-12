import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() => runApp(MaterialApp(
  home: HomePage(),
));

class HomePage extends StatefulWidget {

  @override
  _HomePage createState() => _HomePage();
}
  class _HomePage extends State<HomePage> {

    int totalRoll = 0;
    int saveTotalDiceRoll = 0;
    int leftDiceNumber = 1;
    int result = 2;
    String diceLabel = "D6: Six sided dice";

    _diceSelectionMenu(BuildContext context) {
      return showDialog(context: context, builder: (context) {
        return AlertDialog(
          title: Text('Select a dice', textAlign: TextAlign.center,),
          content: _buildChild(context)
        );
      });
    }

    _buildChild(BuildContext context) => Container(
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
              "D4: Four-sided dice",
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
              diceLabel = "D6: Six sided dice";
              Navigator.of(context, rootNavigator: true).pop(result);
            },
            child: Text(
              "D6: Six sided dice",
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
              "D8: Eight sided dice",
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
              "D10: 10 sided dice",
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
              "D12: 12 sided dice",
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
              "D20: 20 sided dice",
              style: TextStyle(fontSize: 20.0),
            ),
          )
        ],
      ),
    );




    @override
    void initState() {
      super.initState();
      Timer.run(() {
        _diceSelectionMenu(context);
      });

    }

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
      if (saveTotalDiceRoll != 0) {
        totalRoll--;
        saveTotalDiceRoll--;
      }
    }

    Widget build(BuildContext context) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      return MaterialApp(
        home: Scaffold(
          backgroundColor: Color(0xFF2ecc71),
          appBar: AppBar(
            centerTitle: true,
            title: Text('Dice - $diceLabel'),
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
                            _diceSelectionMenu(context);
                          },
                          textColor: Colors.white,
                          color: Color(0xFF27ae60),
                          padding: const EdgeInsets.all(8.0),
                          child: new Text(
                              "Select Dice",
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
                          // diceSelectionMenu(context);
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
