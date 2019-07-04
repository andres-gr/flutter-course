import 'package:flutter/material.dart';

import 'package:udemy_course/quiz.dart';
import 'package:udemy_course/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({
    Key key,
  }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Whats fav color?',
      'answers': [
        {
          'text': 'Black',
          'score': 10,
        },
        {
          'text': 'Blue',
          'score': 5,
        },
        {
          'text': 'Red',
          'score': 8,
        },
        {
          'text': 'Green',
          'score': 1,
        },
      ],
    },
    {
      'questionText': 'Whats fav animal?',
      'answers': [
        {
          'text': 'Snake',
          'score': 1,
        },
        {
          'text': 'Ocelot',
          'score': 4,
        },
        {
          'text': 'Boss',
          'score': 0,
        },
        {
          'text': 'Zero',
          'score': 10,
        },
      ]
    },
    {
      'questionText': 'Fav instructor?',
      'answers': [
        {
          'text': 'Max',
          'score': 1,
        },
        {
          'text': 'Colt',
          'score': 3,
        },
        {
          'text': 'Spencer',
          'score': 5,
        },
        {
          'text': 'Peggy',
          'score': 7,
        },
      ],
    }
  ];

  var _index = 0;

  var _score = 0;

  void _answerQuestion(int score) {
    if (_index < _questions.length) {
      _score += score;
      setState(() {
        _index += 1;
      });
    }
  }

  void _resetState() {
    setState(() {
      _score = 0;
      _index = 0;
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
        body: _index < _questions.length
            ? Quiz(
                handleAnswer: _answerQuestion,
                index: _index,
                questions: _questions,
              )
            : Result(
                handleReset: _resetState,
                score: _score,
              ),
      ),
    );
  }
}
