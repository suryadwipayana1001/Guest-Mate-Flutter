import 'package:flutter/material.dart';
import '../../core.dart';

class CustomContainer extends StatefulWidget {
  final Widget widget;
  final double? width;
  final double? height;
  final double? padding;
  const CustomContainer(
      {super.key, required this.widget, this.width, this.height, this.padding});

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? SizeConfig(context).appWidth(100),
      height: widget.height,
      decoration: BoxDecoration(
        color: white,
        border: Border.all(color: border, width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(widget.padding ?? paddingsizeMedium),
        child: widget.widget,
      ),
    );
  }
}
