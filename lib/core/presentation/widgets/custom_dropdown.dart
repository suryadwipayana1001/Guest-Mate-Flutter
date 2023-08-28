import 'package:flutter/material.dart';
import 'package:forecasting/core/core.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> dropdownList;
  final String title;
  final String? value;
  final FormFieldValidator? fieldValidator;
  final void Function(String?)? onChanged;
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
          padding: const EdgeInsets.symmetric(vertical: sizeSmall),
          child: Text(
            widget.title,
            style: boldTextStyle,
          ),
        ),
        ButtonTheme(
          alignedDropdown: true,
          child: DropdownButtonFormField<String>(
            elevation: 2,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: border, width: 1.0),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: red, width: 1.0),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.0),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: border, width: 1.0),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
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
              Icons.keyboard_arrow_down_rounded,
              color: border,
              size: 40.0,
            ),
            iconSize: 50.0,
            style: lightTextStyle,
            onChanged: widget.onChanged,
            items: widget.dropdownList.map<DropdownMenuItem<String>>(
              (String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
