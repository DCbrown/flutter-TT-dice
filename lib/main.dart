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
    int diceNumber = 1;
    int result = 2;
    String diceDir = "d4";
    String diceLabel = "D6: Six sided dice";

    _diceSelectionMenu(BuildContext context) {
      return showDialog(context: context, builder: (context) {
        return AlertDialog(
          title: Text('Select a dice', textAlign: TextAlign.center,),
          content: _buildChild(context)
        );
      });
    }



    @override
    void initState() {
      super.initState();
      Timer.run(() {
        _diceSelectionMenu(context);
      });
    }

    void diceRoll() {
      // diceNumber = Random().nextInt(6) + 1;
      var dice = diceLabel;
      print('one');
      switch(dice) {
        case "D4: Four sided dice": {
          print('4');
          diceDir = "d4";
          diceNumber = Random().nextInt(4) + 1;
        }
        break;

        case "D6: Six sided dice": {
          print('6');
          diceDir = "d6";
          diceNumber = Random().nextInt(6) + 1;
        }
        break;

        case "D8: Eight sided dice": {
          print('8');
          diceDir = "d8";
          diceNumber = Random().nextInt(8) + 1;
        }
        break;

        case "D10: Ten sided dice": {
          print('10');
          diceDir = "d10";
          diceNumber = Random().nextInt(10) + 1;
        }
        break;

        case "D12: Twelve sided dice": {
          print('12');
          diceDir = "d12";
          diceNumber = Random().nextInt(12) + 1;
        }
        break;

        case "D20: Twenty sided dice": {
          print('20');
          diceDir = "d20";
          diceNumber = Random().nextInt(20) + 1;
        }
        break;

        default: {
          print("Invalid choice");
        }
        break;

      }

    }

    void saveDiceRoll() {
      totalRoll = diceNumber + totalRoll;
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
              setState(() {
                diceLabel = "D4: Four sided dice";
                diceRoll();
                Navigator.of(context, rootNavigator: true).pop(result);
              });
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
              setState(() {
                diceLabel = "D6: Six sided dice";
                diceRoll();
                Navigator.of(context, rootNavigator: true).pop(result);
              });
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
              setState(() {
                diceLabel = "D8: Eight sided dice";
                diceRoll();
                Navigator.of(context, rootNavigator: true).pop(result);
              });
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
              setState(() {
                diceLabel = "D10: Ten sided dice";
                diceRoll();
                Navigator.of(context, rootNavigator: true).pop(result);
              });
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
              setState(() {
                diceLabel = "D12: Twelve sided dice";
                diceRoll();
                Navigator.of(context, rootNavigator: true).pop(result);
              });
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
              setState(() {
                diceLabel = "D20: Twenty sided dice";
                diceRoll();
                Navigator.of(context, rootNavigator: true).pop(result);
              });
            },
            child: Text(
              "D20: 20 sided dice",
              style: TextStyle(fontSize: 20.0),
            ),
          )
        ],
      ),
    );

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
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        child: Image.asset('images/$diceDir$diceNumber.png'),
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
                Padding(
                  padding: const EdgeInsets.only(top:10.0),
                  child: Row(
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
                            "Clear (Hold for 3 sec)",
                            style: TextStyle(fontSize: 20)
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
