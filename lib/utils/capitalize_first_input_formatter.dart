import 'package:flutter/services.dart';

class CapitalizeFirstInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    if (newValue.text.isNotEmpty && newValue.text[0] != newValue.text[0].toUpperCase()) {
      String newText = newValue.text[0].toUpperCase() + newValue.text.substring(1);
      return TextEditingValue(
        text: newText,
        selection: newValue.selection,
      );
    }
    return newValue;
  }
}