import 'package:flutter/material.dart';

class RadioGroupH extends StatelessWidget {
  final ValueChanged<String?> onChanged;
  final String? selected;
  const RadioGroupH({super.key, required this.onChanged, required this.selected});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Radio<String>(
          value: 'Male',
          groupValue: selected,
          onChanged: onChanged,
        ),
        const Text('Male'),
        Radio<String>(
          value: 'Female',
          groupValue: selected,
          onChanged: onChanged,
        ),
        const Text('Female'),
        Radio<String>(
          value: 'Other',
          groupValue: selected,
          onChanged: onChanged,
        ),
        const Text('Other'),
      ],
    );
  }
}
