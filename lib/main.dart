import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          title: const Text('My Dice'),
          backgroundColor: Colors.teal,
        ),
        body: const DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  void addDiceFaceLeft() {
    setState(() {
      leftDiceNumber++;

    });
  }

  void addDiceFaceRight() {
    setState(() {

      rightDiceNumber++;
    });
  }

  void returntoZero() {
    setState(() {
      leftDiceNumber = 1 ;
      rightDiceNumber = 1 ;
    });
  }

  void returntoZeroLeft() {
    setState(() {
      leftDiceNumber = 1 ;
    });
  }

  void returntoZeroRight() {
    setState(() {
      rightDiceNumber = 1 ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              child: Image.asset(
                'images/dice$leftDiceNumber.png',
              ),
              onPressed: () {
                if(leftDiceNumber==6){
                  returntoZeroLeft();
                }
                else{
                  addDiceFaceLeft() ;
                }
              },
            ),
          ),
          Expanded(
            child: TextButton(
              child: Image.asset(
                'images/dice$rightDiceNumber.png',
              ),
              onPressed: () {
                if(rightDiceNumber==6){
                  returntoZeroRight();
                }
                else{
                  addDiceFaceRight() ;
                }
              },
            ),
          ),
          Expanded(
            child: TextButton(
              child: Text(
                'Click to Random',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                changeDiceFace();
              },
            ),
          ),
          Expanded(
            child: TextButton(
              child: Text(
                'Return to Zero',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                returntoZero();
              },
            ),
          ),
        ],
      ),
    );
  }
}
