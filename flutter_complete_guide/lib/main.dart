import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var questionIdx = 0;
  var totalScore = 0;

  static const questions = [
    {
      'questionText': "what's your favorite color?",
      'answer': [
        {'text': 'Black', "score": 10},
        {'text': 'Red', "score": 40},
        {'text': 'Green', "score": 20},
        {'text': 'White', "score": 30},
      ]
    },
    {
      'questionText': "what's your favorite animarl?",
      'answer': [
        {'text': 'Rabbit', "score": 10},
        {'text': 'Cat', "score": 40},
        {'text': 'Dog', "score": 20},
        {'text': 'Bird', "score": 30},
      ]
    },
  ];

  void restartQuiz() {
    setState(() {
      questionIdx = 0;
      totalScore = 0;
    });
  }

  void answerQuestion(int score) {
    totalScore = totalScore + score;
    if (questionIdx < questions.length) {
      setState(() {
        questionIdx = questionIdx + 1;
        print('answer choosed!');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('My First App!')),
            body: questionIdx < questions.length
                ? Quiz(
                    answerQuestion: answerQuestion,
                    questions: questions,
                    questionIdx: questionIdx)
                : Result(totalScore, restartQuiz)));
  }
}
