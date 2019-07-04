import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;

  final Function handleAnswer;

  const Answer({
    Key key,
    @required this.answerText,
    @required this.handleAnswer,
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
