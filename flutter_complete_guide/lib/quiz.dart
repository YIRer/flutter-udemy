import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIdx;
  final Function answerQuestion;

  Quiz(
      {@required this.answerQuestion,
      @required this.questions,
      @required this.questionIdx});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(questions[questionIdx]['questionText']),
        ...(questions[questionIdx]['answer'] as List<Map<String, Object>>)
            .map(
              (answer) => Answer(
                  () => {answerQuestion(answer['score'])}, answer['text']),
            )
            .toList()
      ],
    );
  }
}
