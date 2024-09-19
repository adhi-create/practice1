import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'package:providerpractice/VideoSreen/CarouselPage.dart';
import 'package:providerpractice/VideoSreen/Provider/providerProduct.dart';
import 'package:providerpractice/VideoSreen/search/searchpage.dart';
import 'package:providerpractice/VideoSreen/secondPage.dart';
import 'package:providerpractice/VideoSreen/videolist.dart';
import 'package:providerpractice/VideoSreen/videolist1.dart';
import 'package:providerpractice/components/section_title.dart';
import 'package:providerpractice/prouctliste.dart';

class MyHomePage1 extends StatefulWidget {
  const MyHomePage1({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage1> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage1> {
  final String apiUrl = 'https://retoolapi.dev/mgcrCQ/data';
  late http.Client client;
  List<dynamic> data = [];
  bool isLoading = true; // List to store fetched data

  @override
  void initState() {
    super.initState();

    Provider.of<VideoProviderProducts>(context, listen: false).fetchData1();

    Provider.of<VideoProviderProducts2>(context, listen: false).fetchData2();
    Provider.of<VideoProviderProducts3>(context, listen: false).fetchData3();
  }

  @override
  void dispose() {
    client.close();
    super.dispose();
  }

  // Future<void> fetchData() async {
  //   final response = await client.get(Uri.parse(apiUrl));

  //   if (response.statusCode == 200) {
  //     List<dynamic> jsonData = json.decode(response.body);

  //     setState(() {
  //       data = jsonData;
  //       isLoading = false;
  //     });
  //   } else {
  //     throw Exception('Failed to load data from API');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<VideoProviderProducts>(context);
    final data = dataProvider.data;
    final dataProvider2 = Provider.of<VideoProviderProducts2>(context);
    final data2 = dataProvider2.data2;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 70,
        title: const Text(
          'Cinima',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              height: 25),
        ),
        // leading: Icon(
        //   Icons.menu,
        //   color: Colors.black,
        // ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                showSearch(
                    context: context,
                    // delegate to customize the search bar
                    delegate: CustomSearchDelegate());
              },
              child: const Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      //backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (isLoading) // Show loading indicator if data is being loaded
              const CircularProgressIndicator(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 220,
                child: const CarouselSliderWithApi(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SectionTitle(
                title: "Tranding Collection",
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VideoListPage1()));
                },
              ),
            ),
            SizedBox(
              height: 250,
              child: SizedBox(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final reverseindex = data.length - 1 - index;
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SecondPage(
                                          videoUrl: data[reverseindex]
                                                  ["videotrending"] ??
                                              '')));
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Image.network(
                                      data[reverseindex]
                                              ["Imagetrendingshort"] ??
                                          '',
                                      fit: BoxFit.cover,
                                      height: 200,
                                      width: 300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SectionTitle(
                title: "favorite",
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VideoListPage()));
                },
              ),
            ),
            SizedBox(
              height: 250,
              child: SizedBox(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data2.length,
                  itemBuilder: (context, index) {
                    final reverseindex = data2.length - 1 - index;
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SecondPage(
                                          videoUrl: data2[reverseindex]
                                                  ["videoshortfilm"] ??
                                              '')));
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.network(
                                    data2[reverseindex]["Imageshortfilm"] ?? '',
                                    fit: BoxFit.cover,
                                    height: 200,
                                    width: 300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
