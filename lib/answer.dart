import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function handleAnswer;

  Answer({
    Key key,
    this.handleAnswer,
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
        child: const Text('Answer 1'),
        onPressed: handleAnswer,
      ),
    );
  }
}
