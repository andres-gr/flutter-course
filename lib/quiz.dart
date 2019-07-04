import 'package:flutter/material.dart';

import 'package:udemy_course/answer.dart';
import 'package:udemy_course/question.dart';

class Quiz extends StatelessWidget {
  final Function handleAnswer;

  final int index;

  final List<Map<String, Object>> questions;

  const Quiz({
    Key key,
    @required this.handleAnswer,
    @required this.index,
    @required this.questions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Center(
        child: Column(
          children: <Widget>[
            Question(
              questionText: questions[index]['questionText'],
            ),
            ...(questions[index]['answers'] as List<Map<String, Object>>)
                .map(
                  (answer) => Answer(
                        handleAnswer: () {
                          handleAnswer(answer['score']);
                        },
                        answerText: answer['text'],
                      ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
