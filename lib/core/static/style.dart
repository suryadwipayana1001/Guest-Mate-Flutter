import 'package:flutter/material.dart';
import '../core.dart';

TextStyle landingTextSyle = const TextStyle(
  fontSize: textExtraLarge,
  color: white,
  fontWeight: FontWeight.w600,
);
TextStyle boldTextStyle = const TextStyle(
  fontSize: textSmall,
  color: white,
  fontWeight: FontWeight.w400,
);
TextStyle loadingTextStyle = const TextStyle(
  fontSize: textMedium,
  fontWeight: FontWeight.w500,
  color: white,
);
//END JODOH

TextStyle normalTextStyle = const TextStyle(
    fontSize: textSmall,
    color: black,
    fontWeight: FontWeight.w400,
    wordSpacing: 1.0);

TextStyle titleTextStyle = const TextStyle(
  fontSize: textMedium,
  fontWeight: FontWeight.w500,
  color: black,
);

TextStyle normalBoldTextStyle = const TextStyle(
  fontSize: textMedium,
  color: black,
  fontWeight: FontWeight.w600,
);
TextStyle smallLightTextStyle = const TextStyle(
  fontSize: textExtrasmall,
  fontWeight: FontWeight.w300,
  color: black,
);
TextStyle lightTextStyle = const TextStyle(
  fontSize: textSmall,
  fontWeight: FontWeight.w300,
  color: black,
);

TextStyle buttonTextStyle = const TextStyle(
  fontSize: textMedium,
  fontWeight: FontWeight.w500,
  color: white,
);

TextStyle questationTextStyle = const TextStyle(
  fontSize: textLarge,
  fontWeight: FontWeight.w500,
  color: black,
);

TextStyle exampleAnswerTextStyle = const TextStyle(
  fontSize: textMedium,
  fontWeight: FontWeight.w600,
  color: black,
);

TextStyle contentPerfectPartnerTextStyle = const TextStyle(
  fontSize: textSmall,
  color: black,
  fontWeight: FontWeight.w400,
);

TextStyle normalBlurTextStyle = TextStyle(
  fontSize: textSmall,
  fontWeight: FontWeight.w600,
  foreground: Paint()
    ..style = PaintingStyle.fill
    ..color = black
    ..maskFilter = MaskFilter.blur(BlurStyle.normal, 2.5),
);

TextStyle seeVideoTextStyle = const TextStyle(
  fontSize: textExtrasmall,
  color: black,
  fontWeight: FontWeight.w600,
);
