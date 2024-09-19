//import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:providerpractice/prouctliste.dart';
import 'package:providerpractice/reelPage/player.dart';
import 'package:video_player/video_player.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SecondPage1 extends StatefulWidget {
  const SecondPage1({super.key});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage1> {
  final PageController _pageController = PageController(initialPage: 1);
  List<String> videoUrls = [];
  List<String> imageUrls = [];
  List<String> productUrl = [];
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    fetchDataFromApi();
    _pageController.addListener(() {
      int newPage = _pageController.page!.round();
      if (newPage != currentPage) {
        setState(() {
          currentPage = newPage;
        });
      }
    });
  }

  Future<void> fetchDataFromApi() async {
    // Make an HTTP GET request to your API to fetch the video and image URLs.
    final response =
        await http.get(Uri.parse('https://retoolapi.dev/p6db2K/data'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      setState(() {
        // Assuming your API response is a JSON array with 'videoUrl' and 'imageUrl' keys.
        for (final item in data) {
          videoUrls.add(item['video']);
          imageUrls.add(item['Image2']);
          productUrl.add(item['productUrl']);
        }
      });
    } else {
      throw Exception('Failed to load data from the API');
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   iconTheme: IconThemeData(color: Colors.white),
      //   title: Text(
      //     '',
      //     style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      //   ),
      //   // backgroundColor: Colors.black,
      // ),
      // body: PageView.builder(
      //   // allowImplicitScrolling: true,

      //   controller: _pageController,

      //   scrollDirection: Axis.vertical,
      //   itemCount: videoUrls.length,
      //   itemBuilder: (context, index) {
      //     final reverseindex = videoUrls.length - 1 - index;
      //     return FeedItem(
      //       videoUrl: videoUrls[reverseindex],
      //       // imageUrl: imageUrls[reverseindex],
      //       // productUrl: productUrl[reverseindex],
      //     );
      //   },
      // ),
    );
  }
}
