import 'package:flutter/material.dart';

import '../../core.dart';

class CustomSubtitleQuestation extends StatelessWidget {
  final String title;
  const CustomSubtitleQuestation({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: paddingsizeMedium),
          child: Text(
            title,
            style: questationTextStyle,
          ),
        ),
      ],
    );
  }
}
