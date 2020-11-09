import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function restartQuiz;

  Result(this.resultScore, this.restartQuiz);
  String get resultPharse {
    if (resultScore > 30) {
      return 'You did it!!';
    } else {
      return 'Not Bad!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPharse,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
              child: Text('Restart Quiz!!'),
              textColor: Colors.blue,
              onPressed: this.restartQuiz)
        ],
      ),
    );
  }
}
