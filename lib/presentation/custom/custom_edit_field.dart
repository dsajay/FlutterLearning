import 'package:flutter/material.dart';

import '../../utils/capitalize_first_input_formatter.dart';

class CustomEditText extends StatelessWidget {
  final String? labelText;
  final String hint;
  final TextInputType? inputType;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  const CustomEditText({super.key, this.labelText, required this.hint, this.inputType, this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: inputType  ?? TextInputType.name,
        controller: controller,
        validator: validator,
        inputFormatters: [CapitalizeFirstInputFormatter()],
        decoration:  InputDecoration(
          labelText: labelText,
          fillColor: Colors.white,
          hintText: hint,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          border: const OutlineInputBorder(
              gapPadding: 50,
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ));
  }
}
