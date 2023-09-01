import 'package:flutter/material.dart';

import '../../core.dart';

class CustomVersion extends StatelessWidget {
  const CustomVersion({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          appLoc.appName,
          style: TextStyle(
              color: white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          'Version 2.0.0',
          style: TextStyle(
              color: white, fontSize: 16.0, fontWeight: FontWeight.w300),
        )
      ],
    );
  }
}
