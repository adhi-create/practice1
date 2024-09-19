import 'package:flutter/material.dart';

class Detailspagestories extends StatefulWidget {
  const Detailspagestories({super.key});

  @override
  State<Detailspagestories> createState() => _DetailspagestoriesState();
}

class _DetailspagestoriesState extends State<Detailspagestories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Container(
            // height: MediaQuery.of(context).size.height / 0,
            // width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.only()),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Image.asset(
                      'assets/vadanampink.png',
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 600,
            child: SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 200,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Implement navigation to the episode's details or video player
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/vadanampink.png',
                                    // Replace with actual field
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  '${'Ep'} ${'1'} ${'name'}', // Adjust with actual data
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
