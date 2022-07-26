import 'package:flutter/material.dart';

TextStyle textStyle(double fontSize, Color color) {
  return TextStyle(
      color: color,
      fontFamily: 'Times New Roman',
      fontSize: fontSize,
      fontWeight: FontWeight.bold);
}

class TextForBeer extends StatelessWidget {
  String text;
  double fontSize;
  Color color;
  TextForBeer(
      {Key? key,
      required this.text,
      required this.fontSize,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle(fontSize, color),
    );
  }
}
