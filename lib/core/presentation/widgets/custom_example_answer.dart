import 'package:flutter/material.dart';
import '../../core.dart';

class CustomExampleAnswer extends StatelessWidget {
  final String text;

  const CustomExampleAnswer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: paddingsizeMedium),
      child: Text(
        text,
        style: exampleAnswerTextStyle,
      ),
    );
  }
}
