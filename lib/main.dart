import 'package:flutter/material.dart';

import 'package:udemy_course/answer.dart';
import 'package:udemy_course/question.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({
    Key key,
  }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = [
    'Whats fav color?',
    'Whats fav animal?',
  ];

  var _index = 0;

  void _answerQuestion() {
    setState(() {
      _index = _index + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Column(
              children: <Widget>[
                Question(
                  questionText: _questions[_index],
                ),
                Answer(
                  handleAnswer: _answerQuestion,
                ),
                Answer(
                  handleAnswer: _answerQuestion,
                ),
                Answer(
                  handleAnswer: _answerQuestion,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
