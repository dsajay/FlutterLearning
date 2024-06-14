import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  const CustomButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.grey, // Outer border color
          width: 1.0, // Outer border width
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Center(child: Text(text ,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 20))),
    );
  }
}
