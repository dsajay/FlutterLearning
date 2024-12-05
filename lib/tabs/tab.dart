import 'package:flutter/material.dart';
import 'package:flutter1/tabs/full_screen.dart';

class TabUI extends StatelessWidget {
  final String name;

  const TabUI({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  FullScreenImage()),
        );
      }, child: Text(name)),
    );
  }
}
