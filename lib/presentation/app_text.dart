import 'package:flutter/material.dart';

TextStyle textStyle(double fontSize, Color color) {
  return TextStyle(
      color: color,
      fontFamily: 'Times New Roman',
      fontSize: fontSize,
      fontWeight: FontWeight.bold);
}

class TextForBeer extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  const TextForBeer(
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
