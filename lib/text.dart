import 'package:flutter/material.dart';

class TextDisplay extends StatelessWidget {
  final List<String> texts;

  final int index;

  const TextDisplay({
    Key key,
    @required this.texts,
    @required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      texts[index],
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}
