import 'package:flutter/material.dart';
import 'package:flutter1/tabs/tab.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        initialIndex: 1, // Set the default tab index (starts at 0)
        length: 3, // Number of tabs
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Primary and Secondary TabBar'),
            bottom:  TabBar(
              isScrollable: true,
              dividerColor: Colors.transparent, // No divider between tabs
              tabs: <Widget>[
                Tab(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal:8, vertical: 8), // Padding inside the container
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),  // Background color with opacity
                      borderRadius: BorderRadius.circular(16),  // Rounded corners
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.flight),  // Icon for Flights tab
                        SizedBox(width: 8),  // Space between icon and text
                        Text('Flights'),  // Text for Flights tab
                      ],
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8), // Padding inside the container
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),  // Background color with opacity
                      borderRadius: BorderRadius.circular(16),  // Rounded corners
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.flight),  // Icon for Flights tab
                        SizedBox(width: 8),  // Space between icon and text
                        Text('Flights'),  // Text for Flights tab
                      ],
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8), // Padding inside the container
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),  // Background color with opacity
                      borderRadius: BorderRadius.circular(16),  // Rounded corners
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.flight),  // Icon for Flights tab
                        SizedBox(width: 8),  // Space between icon and text
                        Text('Explore'),  // Text for Flights tab
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
          body: const TabBarView(
            children: <Widget>[
              TabUI(name: 'Flights'),  // Tab content for Flights
              TabUI(name: 'Trips'),    // Tab content for Trips
              TabUI(name: 'Explore'),  // Tab content for Explore
            ],
          ),
        ),
      ),
    );
  }
}
