import 'package:flutter/material.dart';
import 'package:forecasting/core/core.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final double? height;
  final double? width;
  final void Function() onPressed;

  CustomButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.height,
      this.width})
      : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        textStyle: buttonTextStyle,
        backgroundColor: button,
        padding: EdgeInsets.all(paddingSizeExtraSmall),
        elevation: 0.0,
        fixedSize: Size(widget.width ?? SizeConfig(context).appWidth(100),
            widget.height ?? 45.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onPressed: widget.onPressed,
      child: Text(widget.text),
    );
  }
}
