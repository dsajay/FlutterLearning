import 'package:flutter/material.dart';
import 'package:flutter1/tabs/full_screen.dart';
import 'package:workmanager/workmanager.dart';

class TabUI extends StatelessWidget {
  final String name;

  const TabUI({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(onTap: () {
        cancelTask();
        Workmanager().registerPeriodicTask(
          "uniqueName",
          "backgroundTask",
          frequency: const Duration(minutes: 15), // Minimum is 15 minutes
          inputData: {"key": "value"}, // Optional input data
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  FullScreenImage()),
        );
      }, child: Text(name)),
    );
  }

  void cancelTask() async {
    await Workmanager().cancelAll();
  }
}
