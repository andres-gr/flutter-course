import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function handleAnswer;

  final String answerText;

  const Answer({
    Key key,
    this.handleAnswer,
    this.answerText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 8,
      ),
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(answerText),
        onPressed: handleAnswer,
      ),
    );
  }
}
