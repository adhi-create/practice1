//
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerpractice/Homepagecategory/Provider/providerProduct.dart';
import 'package:providerpractice/ProductsListPage/listviewproduct.dart';
import 'package:providerpractice/ProductsListPage/pageview.dart';
import 'package:providerpractice/ProductsListPage/section_title.dart';

class MyHomePage7 extends StatefulWidget {
  const MyHomePage7({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage7> {
  int currentIndex = 0;
  final PageController _pageController = PageController();
  //
  @override
  void initState() {
    super.initState();
    // Fetch data here using your Provider or any other method.
    Provider.of<ProviderProducts>(context, listen: false).fetchData1();
    Provider.of<ProviderProducts2>(context, listen: false).fetchData2();
    Provider.of<ProviderProducts3>(context, listen: false).fetchData3();
    Provider.of<ProviderProducts4>(context, listen: false).fetchData4();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'FRIENDS Mall',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Your other widgets

            // Use FutureBuilder to load data and show loading indicator
            FutureBuilder<void>(
              future: fetchData(), // Replace with your data fetching method
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  // Data has been fetched, you can display your widgets here
                  final dataProvider = Provider.of<ProviderProducts>(context);
                  final dataProvider2 = Provider.of<ProviderProducts2>(context);
                  final dataProvider3 = Provider.of<ProviderProducts3>(context);
                  final dataProvider4 = Provider.of<ProviderProducts4>(context);
                  final data = dataProvider.data;
                  final data2 = dataProvider2.data2;
                  final data3 = dataProvider3.data3;
                  final data4 = dataProvider4.data4;

                  // Continue building your UI with the fetched data
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SectionTitle(
                          title: "Trending Collection",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => listproduct(
                                  currentIndex: currentIndex,
                                  items: data,
                                ),
                              ),
                            );
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
                                      // onTap: () {
                                      //   Navigator.push(
                                      //       context,
                                      //       MaterialPageRoute(
                                      //           builder: (context) => SecondPage(
                                      //               videoUrl:
                                      //                   data[index]["videoUrL"] ?? '')));
                                      // },

                                      onTap: () {
                                        setState(() {
                                          currentIndex = reverseindex;
                                        });

                                        final currentItem = data[reverseindex];
                                        // final productName = currentItem['name'];
                                        // final productUrl = currentItem['productUrl'];
                                        // final imageUrl = currentItem['imageUrl'];

                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ItemDetailsPage(
                                              currentIndex: currentIndex,
                                              items: data,
                                              // Pass the entire data list
                                            ),
                                          ),
                                        );
                                      },

                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Card(
                                                child: Image.network(
                                                  data[reverseindex]['Image'] ??
                                                      '',
                                                  fit: BoxFit.cover,
                                                  height: 200,
                                                  width: 100,
                                                ),
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
                          ))),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SectionTitle(
                          title: "Mens trending",
                          press: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => listproduct(
                                          currentIndex: currentIndex,
                                          items: data2,
                                        )));
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
                                      // onTap: () {
                                      //   Navigator.push(
                                      //       context,
                                      //       MaterialPageRoute(
                                      //           builder: (context) => SecondPage(
                                      //               videoUrl:
                                      //                   data[index]["videoUrL"] ?? '')));
                                      // },

                                      onTap: () {
                                        setState(() {
                                          currentIndex = reverseindex;
                                        });

                                        final currentItem = data2[reverseindex];
                                        // final productName = currentItem['name'];
                                        // final productUrl = currentItem['productUrl'];
                                        // final imageUrl = currentItem['imageUrl'];

                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ItemDetailsPage(
                                              currentIndex: currentIndex,
                                              items: data2,
                                              // Pass the entire data list
                                            ),
                                          ),
                                        );
                                      },

                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Card(
                                                child: Image.network(
                                                  data2[reverseindex]
                                                          ['Image'] ??
                                                      '',
                                                  fit: BoxFit.cover,
                                                  height: 200,
                                                  width: 100,
                                                ),
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
                          ))),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SectionTitle(
                          title: "Sarees trending",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => listproduct(
                                  currentIndex: currentIndex,
                                  items: data4,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                          height: 250,
                          child: SizedBox(
                              child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: data4.length,
                            itemBuilder: (context, index) {
                              final reverseindex = data4.length - 1 - index;
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      // onTap: () {
                                      //   Navigator.push(
                                      //       context,
                                      //       MaterialPageRoute(
                                      //           builder: (context) => SecondPage(
                                      //               videoUrl:
                                      //                   data[index]["videoUrL"] ?? '')));
                                      // },

                                      onTap: () {
                                        setState(() {
                                          currentIndex = reverseindex;
                                        });

                                        final currentItem = data4[reverseindex];
                                        // final productName = currentItem['name'];
                                        // final productUrl = currentItem['productUrl'];
                                        // final imageUrl = currentItem['imageUrl'];

                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ItemDetailsPage(
                                              currentIndex: currentIndex,
                                              items: data4,
                                              // Pass the entire data list
                                            ),
                                          ),
                                        );
                                      },

                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Card(
                                                child: Image.network(
                                                  data4[reverseindex]
                                                          ['Image'] ??
                                                      '',
                                                  fit: BoxFit.cover,
                                                  height: 200,
                                                  width: 100,
                                                ),
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
                          ))),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SectionTitle(
                          title: "Girls trending",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => listproduct(
                                  currentIndex: currentIndex,
                                  items: data3,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                          height: 250,
                          child: SizedBox(
                              child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: data3.length,
                            itemBuilder: (context, index) {
                              final reverseindex = data3.length - 1 - index;
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      // onTap: () {
                                      //   Navigator.push(
                                      //       context,
                                      //       MaterialPageRoute(
                                      //           builder: (context) => SecondPage(
                                      //               videoUrl:
                                      //                   data[index]["videoUrL"] ?? '')));
                                      // },

                                      onTap: () {
                                        setState(() {
                                          currentIndex = reverseindex;
                                        });

                                        final currentItem = data3[reverseindex];
                                        // final productName = currentItem['name'];
                                        // final productUrl = currentItem['productUrl'];
                                        // final imageUrl = currentItem['imageUrl'];

                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ItemDetailsPage(
                                              currentIndex: currentIndex,
                                              items: data3,
                                              // Pass the entire data list
                                            ),
                                          ),
                                        );
                                      },

                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Card(
                                                child: Image.network(
                                                  data3[reverseindex]
                                                          ['Image'] ??
                                                      '',
                                                  fit: BoxFit.cover,
                                                  height: 200,
                                                  width: 100,
                                                ),
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
                          ))),

                      // Rest of your widgets using 'data'
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

//
  Future<void> fetchData() async {
    // Replace with your data fetching logic
    // This is just a placeholder for illustration
    await Future.delayed(
        const Duration(seconds: 4)); // Simulate an async operation
  }
}
// 