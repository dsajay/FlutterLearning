import 'package:flutter/material.dart';

class FullScreenImage extends StatelessWidget {
  final String imageUrl = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCIU-lU8dYzdjkBdwK47NSOj0ulFFV6jVvvg&s'; // Replace with your image URL

  // Function to launch WhatsApp
  Future<void> _launchWhatsApp() async {
    final String url = "https://wa.me/?text=Check%20out%20this%20image%20${Uri.encodeComponent(imageUrl)}";
  }

  // Function to download the image (Here, we just show a placeholder)
  Future<void> _downloadImage() async {
    // Logic to download the image goes here.
    // For demonstration, we show a simple alert.
    print("Image downloaded");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                imageUrl,
                fit: BoxFit.contain,
              ),
            ),
            // Full-screen image
            Positioned(
              top: 40,
              left: 10,
              child: IconButton(
                onPressed: (){Navigator.pop(context);},
                icon: const Icon(Icons.arrow_back, color: Colors.black, size: 30),
              ),
            ),

            // Buttons for Download, Share, and WhatsApp
            Positioned(
              bottom: 40,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Download button
                  IconButton(
                    onPressed: _downloadImage,
                    icon: const Icon(Icons.download, color: Colors.black, size: 30),
                  ),
                  // Share button (Here we use a simple icon, you can implement share functionality)
                  IconButton(
                    onPressed: () {
                      // Implement share logic here
                      print('Share button clicked');
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.share, color: Colors.black, size: 30),
                  ),
                  // WhatsApp button
                  IconButton(
                    onPressed: _launchWhatsApp,
                    icon: const Icon(Icons.chat, color: Colors.black, size: 30),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
