import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../core.dart';

class ValidationHelper {
  final AppLocalizations? loc;
  final Function(bool value) isError;
  final String? requiredMessage;
  final TypeField typeField;

  ValidationHelper(
      {this.loc,
      required this.isError,
      this.requiredMessage,
      required this.typeField});

  FormFieldValidator validate() {
    String? message;
    return (value) {
      final strValue = value as String;
      if (strValue.isEmpty) {
        message = requiredMessage ?? appLoc.cannotEmpty;
        isError(true);
      }
      return message;
    };
  }
}
