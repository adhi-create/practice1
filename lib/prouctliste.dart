import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductList extends StatelessWidget {
  final String image1;
  final String productUrl;

  const ProductList(
      {super.key, required this.image1, required this.productUrl});

  _launchURL(String productUrl) async {
    if (await canLaunch(productUrl)) {
      await launch(productUrl);
    } else {
      throw 'Could not launch $productUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('IN THIS VIDEO'),
      ),
      body: Center(
        child: Card(
          child: Column(
            children: [
              Image.network(
                image1,
                fit: BoxFit.cover,
                width: 200,
                height: 250, // Adjust the image height as needed
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    // Background color
                    ),
                onPressed: () {
                  // Open the provided URL when the button is pressed
                  _launchURL(productUrl);
                },
                child: const Text(
                  'Buy',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
