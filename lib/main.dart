import 'package:flutter/material.dart';

import 'package:udemy_course/text.dart';
import 'package:udemy_course/text_control.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({
    Key key,
  }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _texts = const [
    'Hello there',
    'General Kenobi',
  ];

  var _index = 0;

  void _changeIndex() {
    setState(() {
      if (_index > 0) {
        _index = 0;
      } else {
        _index = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment 1',
      home: Scaffold(
        appBar: AppBar(
          title: Text('First Assignment'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextDisplay(
                texts: _texts,
                index: _index,
              ),
              TextControl(
                handlePress: _changeIndex,
              )
            ],
          ),
        ),
      ),
    );
  }
}
