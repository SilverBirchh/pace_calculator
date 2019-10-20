import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  Header(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(border: Border(bottom: BorderSide())),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 20, letterSpacing: .5, fontWeight: FontWeight.w500),
      ),
    );
  }
}
