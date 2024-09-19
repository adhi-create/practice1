import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerpractice/Homepagecategory/Marketplace/marketplaceopeningpage.dart';
import 'package:providerpractice/Homepagecategory/Provider/providerProduct.dart';
import 'package:providerpractice/VideoSreen/Provider/providerProduct.dart';
import 'package:providerpractice/VideoSreen/favoritepage1.dart';

class MyHomePag extends StatefulWidget {
  const MyHomePag({
    super.key,
  });

  @override
  State<MyHomePag> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePag> {
  List<Map<String, dynamic>> favoriteItems = [];
  Future<void> _refresh() async {
    // Add your data fetching logic here
    await Provider.of<ProviderProducts6>(context, listen: false).fetchData6();
  }

  @override
  void initState() {
    super.initState();
    // Fetch data on initial load
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<ProviderProducts6>(context);
    final provider = Provider.of<Favoriteprovider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'NECKLESS',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400, fontSize: 18),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FavoritePage()));
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 350, crossAxisCount: 2),
          itemCount: dataProvider.data6.length,
          itemBuilder: (context, int index) {
            final reverseindex = dataProvider.data6.length - 1 - index;
            // final currentItem = dataProvider.data6[reverseindex];
            final words = dataProvider.data6[reverseindex];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsPage(
                            itemDetails: dataProvider.data6[reverseindex])));
              },
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(),
                        child: Image.network(
                          dataProvider.data6[reverseindex]['Image'] ?? '',
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              ' ₹${dataProvider.data6[reverseindex]['price'] ?? '.'}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 19.0,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              dataProvider.data6[reverseindex]['title'] ?? '',
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          // IconButton(
                          //     onPressed: () {},
                          //     icon: provider.isExist(words)
                          //         ? Icon(
                          //             Icons.favorite,
                          //             color: Colors.red,
                          //           )
                          //         : Icon(Icons.favorite_border)),
                        ],
                      ),
                    ],
                  ),
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text(
                  //       ' \₹${dataProvider.data6[reverseindex]['price'] ?? '.'}',
                  //       style: TextStyle(
                  //         color: Colors.black,
                  //         fontWeight: FontWeight.w500,
                  //         fontSize: 19.0,
                  //       ),
                  //     ),
                  //     SizedBox(width: 10.0),
                  //     Text(
                  //       dataProvider.data6[reverseindex]['title'] ?? '',
                  //       style: TextStyle(
                  //         fontWeight: FontWeight.w500,
                  //         fontSize: 19.0,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
