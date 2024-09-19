import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:providerpractice/reelPage/playerController.dart';
import 'package:providerpractice/settingpage/settingpage.dart';

class fullview extends StatefulWidget {
  const fullview({super.key});

  @override
  State<fullview> createState() => _fullviewState();
}

class _fullviewState extends State<fullview> {
  final String apiUrl = 'https://retoolapi.dev/6iRWzr/data';
  late http.Client client;
  List<dynamic> data = []; // List to store fetched data

  @override
  void initState() {
    super.initState();
    client = http.Client();
    fetchData1();
  }

  @override
  void dispose() {
    client.close();
    super.dispose();
  }

  Future<void> fetchData1() async {
    final response = await client.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);

      setState(() {
        data = jsonData;
      });
    } else {
      throw Exception('Failed to load data from API');
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      appBar: AppBar(
        title: const Text('kkkkk'),
        backgroundColor: Colors.amber,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (itemWidth / itemHeight),
        ),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondPage1()));
            },
            child: Card(
              child: Image.network(
                data[index]["productImage"] ?? '',
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
