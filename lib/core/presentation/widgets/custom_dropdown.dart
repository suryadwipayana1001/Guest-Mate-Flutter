import 'package:flutter/material.dart';
import 'package:forecasting/core/static/color.dart';
import 'package:forecasting/core/static/dimens.dart';
import 'package:forecasting/core/static/style.dart';

class CustomDropdown extends StatefulWidget {
  final List<dynamic> dropdownList;
  final String title;
  final dynamic value;
  final FormFieldValidator? fieldValidator;
  final void Function(dynamic)? onChanged;
  const CustomDropdown({
    super.key,
    this.fieldValidator,
    required this.dropdownList,
    required this.title,
    this.onChanged,
    this.value,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: sizeMedium),
          child: Text(
            widget.title,
            style: boldTextStyle,
          ),
        ),
        ButtonTheme(
          alignedDropdown: true,
          child: DropdownButtonFormField(
            elevation: 2,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: border, width: 1.0),
                borderRadius: BorderRadius.all(
                  Radius.circular(25.0),
                ),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: red, width: 1.0),
                borderRadius: BorderRadius.all(
                  Radius.circular(25.0),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.0),
                borderRadius: BorderRadius.all(
                  Radius.circular(25.0),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: border, width: 1.0),
                borderRadius: BorderRadius.all(
                  Radius.circular(25.0),
                ),
              ),
              filled: true,
              fillColor: white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 0),
            ),
            isExpanded: true,
            value: widget.value ?? widget.dropdownList.first,
            validator: widget.fieldValidator,
            icon: const Icon(
              Icons.arrow_drop_down_rounded,
              color: black,
            ),
            iconSize: 50.0,
            items: widget.dropdownList.map<DropdownMenuItem<dynamic>>(
              (dynamic option) {
                return DropdownMenuItem<dynamic>(
                  value: option,
                  child: Text(option is String ? option : option.title),
                );
              },
            ).toList(),
            onChanged: widget.onChanged,
          ),
        ),
      ],
    );
  }
}
