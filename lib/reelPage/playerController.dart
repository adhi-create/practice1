import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class PlayerController extends StatefulWidget {
  const PlayerController({super.key});

  @override
  State<PlayerController> createState() => _PlayerControllerState();
}

class _PlayerControllerState extends State<PlayerController> {
  // Properties
  int currentIndex = 0;
  List<String> videoUrls = [];
  List<String> imageUrls = [];

  @override
  void initState() {
    super.initState();
    fetchVideoUrls().then((urls) {
      setState(() {
        videoUrls = urls;
      });
    });
  }

  Future<List<String>> fetchVideoUrls() async {
    final response =
        await http.get(Uri.parse('https://retoolapi.dev/6iRWzr/data'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => item['videoUrl'].toString()).toList();
    } else {
      throw Exception('Failed to load video URLs');
    }
  }

  Future<List<String>> fetchImageUrls() async {
    final response =
        await http.get(Uri.parse('https://retoolapi.dev/6iRWzr/data'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => item['imageUrl'].toString()).toList();
    } else {
      throw Exception('Failed to load image URLs');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player'),
      ),
      // body:

      //     // Adjust the height as needed
      //     PageView.builder(
      //   controller: _pageController,
      //   scrollDirection: Axis.vertical,
      //   itemCount: videoUrls.length,
      //   onPageChanged: (index) {
      //     setState(() {
      //       currentIndex = index;
      //     });
      //   },
      //   itemBuilder: (ctx, index) {
      //     return FeedItem(
      //       url: videoUrls[index],
      //     );
      //   },
      // ),
    );
  }
}
