import 'package:flutter/material.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../core.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            logo,
            height: 200,
          ),
          LoadingAnimationWidget.discreteCircle(
              color: Colors.white,
              size: 80,
              secondRingColor: Colors.black,
              thirdRingColor: Color.fromARGB(255, 255, 0, 166)),
          mediumVerticalSpacing(),
          Text(
            appLoc.pleaseWait,
            style: loadingTextStyle,
          )
        ],
      ),
    );
  }
}
