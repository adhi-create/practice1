import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:providerpractice/Homepagecategory/Provider/providerProduct.dart';

class CarouselSliderWithApi extends StatefulWidget {
  const CarouselSliderWithApi({super.key});

  @override
  _CarouselSliderWithApiState createState() => _CarouselSliderWithApiState();
}

class _CarouselSliderWithApiState extends State<CarouselSliderWithApi> {
  // final String apiUrl = 'https://retoolapi.dev/mgcrCQ/data';
  // late http.Client client;
  // List<dynamic> data = [];

  @override
  void initState() {
    super.initState();
    //client = http.Client();
    //fetchData();
    Provider.of<ProviderProductscate5>(context, listen: false).fetchData5();
  }

  // @override
  // void dispose() {
  //   client.close();
  //   super.dispose();
  // }

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
    final dataProvider = Provider.of<ProviderProductscate5>(context);
    final data5 = dataProvider.data5;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: data5.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return GestureDetector(
                  onTap: () {
                    // You can add your navigation logic here
                    // For example, open a new page with video based on data[index]
                    // You might need to pass additional data to the video page.
                  },
                  child: Container(
                    child: Image.network(
                      data5[index]["image2"] ?? '',
                      fit: BoxFit.cover,
                      height: 300,
                      width: double.infinity,
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
