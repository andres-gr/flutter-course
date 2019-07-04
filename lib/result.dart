import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function handleReset;

  final int score;

  const Result({
    Key key,
    @required this.handleReset,
    @required this.score,
  }) : super(key: key);

  String get resultPhrase {
    String resultText;
    if (score <= 8) {
      resultText = 'Awesome';
    } else if (score <= 12) {
      resultText = 'Likeable';
    } else if (score <= 16) {
      resultText = 'Strange';
    } else {
      resultText = 'Bad';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: const Text('Reset'),
            onPressed: handleReset,
          )
        ],
      ),
    );
  }
}
