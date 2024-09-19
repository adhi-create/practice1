import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:providerpractice/Homepagecategory/Marketplace/marketplace.dart';
import 'package:providerpractice/MyHomepage/item1.dart';
import 'package:providerpractice/ProductsListPage/MyHomePage.dart';
import 'package:providerpractice/VideoSreen/MyHomePage.dart';
import 'package:providerpractice/VideoSreen/secondPage.dart';
import 'package:providerpractice/components/section_title.dart';
import 'package:providerpractice/reelPage/player.dart';
import 'package:providerpractice/settingpage/settingpage.dart';
import 'package:providerpractice/storieshomepage/Trendingviewmore.dart';
import 'package:providerpractice/storieshomepage/detailspagestories.dart';
import 'package:providerpractice/storieshomepage/notifications.dart';
import 'package:providerpractice/videoscreen/videopagedetails.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    late BannerAd _bannerAd;
    bool _isBannerAdReady = false;

    // Initialize the BannerAd
    _bannerAd = BannerAd(
      adUnitId:
          'ca-app-pub-3940256099942544/9214589741', // Replace with your AdMob Banner Ad Unit ID
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          print('BannerAd failed to load: $error');
          ad.dispose();
        },
      ),
    );

    // Load the BannerAd
    _bannerAd.load();

    @override
    void dispose() {
      _bannerAd.dispose();
      super.dispose();
    }

    int _selectedIndex = 0;

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                size: 30,
              ));
        }),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const notifications()));
                },
                icon: const Icon(
                  EneftyIcons.notification_outline,
                  size: 30,
                )),
          ),
        ],
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFF57F17),
              ),
              child: Text(
                'audio stories',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      EneftyIcons.instagram_outline,
                      size: 40,
                    )),
                Text(
                  'Instagram',
                  style: TextStyle(fontSize: 25, color: Colors.black),
                )
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SectionTitle(
              title: "Tranding Stories",
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Trendingviewmore()));
              },
            ),
          ),
          SizedBox(
            height: 200,
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('demo').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) return const CircularProgressIndicator();
                var documents = snapshot.data!.docs;
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    var adhi = documents[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Videopagedetails(
                                        adhiId: adhi.id,
                                        image: adhi['imageUrl'],
                                        writer: adhi['writer'],
                                        title: adhi['title'],
                                        longdescription:
                                            adhi['longedescription'],
                                        firstepisode: adhi['first episode'],
                                      )));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Image.network(
                            adhi['imageUrl'],
                            fit: BoxFit.cover,
                            width: 150,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: _bannerAd.size.height.toDouble(),
        width: _bannerAd.size.width.toDouble(),
        child: AdWidget(ad: _bannerAd),
      ),
    );
  }
}
