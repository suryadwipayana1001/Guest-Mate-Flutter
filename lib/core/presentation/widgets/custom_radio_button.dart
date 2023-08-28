import 'package:flutter/material.dart';

import '../../core.dart';

class CustomRadioButton extends StatefulWidget {
  final String title;
  final dynamic value;
  final dynamic groupValue;
  final dynamic onChanged;
  const CustomRadioButton(
      {super.key,
      required this.title,
      required this.value,
      required this.groupValue,
      required this.onChanged});

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 1.2,
          child: Radio(
              fillColor: MaterialStateColor.resolveWith((states) => black),
              value: widget.value,
              groupValue: widget.groupValue,
              onChanged: widget.onChanged),
        ),
        mediumHorizontalSpacing(),
        Text(widget.title, style: normalTextStyle),
      ],
    );
  }
}
// Row(
//       children: [
//         Transform.scale(
//           scale: 1.2,
//           child: Stack(
//             children: [
//               Radio(
//                   fillColor: MaterialStateColor.resolveWith((states) => black),
//                   value: widget.value,
//                   groupValue: widget.groupValue,
//                   onChanged: widget.onChanged),
//               Positioned(
//                 top: 14,
//                 left: 14,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     border: Border.all(
//                       color: gray,
//                       width: 3,
//                     ),
//                   ),
//                   width: 20,
//                   height: 20,
//                 ),
//               ),
//               Radio(
//                   fillColor: MaterialStateColor.resolveWith(
//                       (states) => Colors.transparent),
//                   value: widget.value,
//                   groupValue: widget.groupValue,
//                   onChanged: widget.onChanged),
//             ],
//           ),
//         ),
//         mediumHorizontalSpacing(),
//         Text(widget.title, style: normalTextStyle),
//       ],
//     );