import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  ErrorText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Text(
        text,
        style: TextStyle(color: Colors.red),
      ),
    );
  }
}
