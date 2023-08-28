import 'package:flutter/material.dart';
import '../../core.dart';

class CustomTitleQuestation extends StatelessWidget {
  final String title;

  const CustomTitleQuestation({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      width: SizeConfig(context).appWidth(100),
      height: 170,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: paddingSizeLarge,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: questationTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
