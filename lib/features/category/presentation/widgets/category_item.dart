import 'package:flutter/material.dart';
import '../../../../core/core.dart';

class CategoryItem extends StatefulWidget {
  final String title;
  final String description;
  final Color? color;
  const CategoryItem(
      {super.key, required this.title, required this.description, this.color});

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: white,
        border: Border.all(color: border, width: 2.0),
        borderRadius: BorderRadius.circular(25.0),
      ),
      width: SizeConfig(context).appWidth(100),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: paddingSizeLarge, vertical: paddingsizeMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: paddingsizeSmall),
              child: Text(
                widget.title,
                style: normalBoldTextStyle,
              ),
            ),
            Text(
              widget.description,
              style: smallLightTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
