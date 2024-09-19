import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:providerpractice/VideoSreen/Provider/providerProduct.dart';
import 'package:providerpractice/VideoSreen/secondPage.dart';

class VideoListPage extends StatefulWidget {
  const VideoListPage({super.key});

  @override
  State<VideoListPage> createState() => _VideoListPageState();
}

class _VideoListPageState extends State<VideoListPage> {
  // final String apiUrl = 'https://retoolapi.dev/mgcrCQ/data';
  // late http.Client client;
  // List<dynamic> data = [];

  @override
  void initState() {
    super.initState();
    // client = http.Client();
    // fetchData();

    Provider.of<VideoProviderProducts>(context, listen: false).fetchData1();
  }

  @override
  void dispose() {
    // client.close();
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
    final dataProvider = Provider.of<VideoProviderProducts>(context);
    final data = dataProvider.data;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Video List'),
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final reverseindex = data.length - 1 - index;
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondPage(
                    videoUrl: data[reverseindex]["videotrending"] ?? '',
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.network(
                data[reverseindex]["Imagetrendingshort"] ?? '',
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
