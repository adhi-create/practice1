import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:providerpractice/VideoSreen/Provider/providerProduct.dart';

class CarouselSliderWithApi extends StatefulWidget {
  const CarouselSliderWithApi({super.key});

  @override
  _CarouselSliderWithApiState createState() => _CarouselSliderWithApiState();
}

class _CarouselSliderWithApiState extends State<CarouselSliderWithApi> {
  // final String apiUrl = 'https://retoolapi.dev/mgcrCQ/data';
  // late http.Client client;
  //List<dynamic> data = [];

  @override
  void initState() {
    super.initState();
    //client = http.Client();
    // fetchData();
    Provider.of<VideoProviderProducts2>(context, listen: false).fetchData2();
  }

  @override
  void dispose() {
    //client.close();
    super.dispose();
  }

  // Future<void> fetchData() async {
  //   final response = await client.get(Uri.parse(apiUrl));

  //   if (response.statusCode == 200) {
  //     List<dynamic> jsonData = json.decode(response.body);

  //     setState(() {
  //       data = jsonData;
  //     });
  //   } else {
  //     throw Exception('Failed to load data from API');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final dataProvider2 = Provider.of<VideoProviderProducts2>(context);
    final data2 = dataProvider2.data2;
    return const Scaffold(
      backgroundColor: Colors.white,
      // body: CarouselSlider.builder(
      //   itemCount: data2.length,
      //   itemBuilder: (BuildContext context, int index, int realIndex) {
      //     final reverseindex = data2.length - 1 - index;
      //     return GestureDetector(
      //       onTap: () {
      //         // You can add your navigation logic here
      //         // For example, open a new page with video based on data[index]
      //         // You might need to pass additional data to the video page.
      //       },
      //       // child: Container(
      //       //   height: 200,
      //       //   width: double.infinity,
      //       //   child: Image.network(
      //       //     data2[reverseindex]["Imageshortfilm"] ?? '',
      //       //     fit: BoxFit.cover,
      //       //   ),
      //       // ),
      //     );
      //   },
      //   options: CarouselOptions(
      //       autoPlay: true,
      //       enlargeCenterPage: true,
      //       aspectRatio: 2.0,
      //       viewportFraction: 0.9

      //       // Increase the width as needed (e.g., 300)
      //       // Adjust the width as needed
      //       ),
      // ),
    );
  }
}
