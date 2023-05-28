// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use


import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;
  const Result(this.resultScore, this.resetHandler);

  String get resultPhase {
    var resultText = 'You did it!';
    if (resultScore >= 4) {
      resultText = 'Excellent\n You Score is 4';
    } else if (resultScore == 3) {
      resultText = 'Very Good\n You Score is 3';
    } else if (resultScore ==2) {
      resultText = 'Not bad\n You Score is 2';
    }else if (resultScore ==1) {
      resultText = 'Bad\n You Score is 1';
    }
    else {
      resultText = 'You are so bad!\n You Score is 0';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhase,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: resetHandler,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Restart Quiz!'),
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          )
        ],
      ),
    );
  }
}