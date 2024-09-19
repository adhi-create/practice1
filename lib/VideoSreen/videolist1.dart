import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerpractice/VideoSreen/Provider/providerProduct.dart';
import 'package:providerpractice/VideoSreen/secondPage.dart';

class VideoListPage1 extends StatefulWidget {
  const VideoListPage1({super.key});

  @override
  State<VideoListPage1> createState() => _VideoListPageState();
}

class _VideoListPageState extends State<VideoListPage1> {
  // final String apiUrl = 'https://retoolapi.dev/mgcrCQ/data';
  // late http.Client client;
  // List<dynamic> data = [];

  @override
  void initState() {
    super.initState();
    // client = http.Client();
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video List'),
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
        itemCount: data2.length,
        itemBuilder: (context, index) {
          final reverseindex = data2.length - 1 - index;
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondPage(
                    videoUrl: data2[reverseindex]["videoshortfilm"] ?? '',
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.network(
                data2[reverseindex]["Imageshortfilm"] ?? '',
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
