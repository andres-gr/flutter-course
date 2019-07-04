import 'package:flutter/material.dart';

class TextControl extends StatelessWidget {
  final Function handlePress;

  const TextControl({
    Key key,
    @required this.handlePress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: const Text(
        'Change text',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      textColor: Colors.blue,
      onPressed: handlePress,
    );
  }
}
