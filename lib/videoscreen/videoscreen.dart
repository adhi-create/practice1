import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:provider/provider.dart';
import 'package:providerpractice/Homepagecategory/Marketplace/wedview/wedview.dart';
import 'package:providerpractice/Homepagecategory/Provider/providerProduct.dart';
import 'package:providerpractice/VideoSreen/Provider/providerProduct.dart';
import 'package:providerpractice/VideoSreen/secondPage.dart';
import 'package:providerpractice/videoscreen/videopagedetails.dart';
import 'package:providerpractice/videoscreen/wedview.dart';
import 'package:upgrader/upgrader.dart';

class MyHomevideo extends StatefulWidget {
  const MyHomevideo({
    super.key,
  });

  @override
  State<MyHomevideo> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomevideo> {
  // late RewardedAd _rewardedAd;
  // bool _isRewardedAdReady = false;
  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;

  List<Map<String, dynamic>> favoriteItems = [];
  Future<void> _refresh() async {
    // Add your data fetching logic here
    {
      await Provider.of<ProviderProductsflim>(context, listen: false)
          .fetchDataflim();
    }
  }

  @override
  void initState() {
    super.initState();
    // Fetch data on initial load
    _refresh();
    // _loadRewardedAd();
    // checkForUpdate();
    _bannerAd = BannerAd(
      adUnitId: '',
      size: AdSize.banner,
      request: const AdRequest(),
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

    _bannerAd.load();
  }

  // void _loadRewardedAd() {
  //   RewardedAd.load(
  //     adUnitId: '',
  //     request: AdRequest(),
  //     rewardedAdLoadCallback: RewardedAdLoadCallback(
  //       onAdLoaded: (RewardedAd ad) {
  //         _rewardedAd = ad;
  //         setState(() {
  //           _isRewardedAdReady = true;
  //         });
  //       },
  //       onAdFailedToLoad: (LoadAdError error) {
  //         print('RewardedAd failed to load: $error');
  //         setState(() {
  //           _isRewardedAdReady = false;
  //         });
  //       },
  //     ),
  //   );
  // }

  // void _showRewardedAd(VoidCallback onAdComplete) {
  //   if (_isRewardedAdReady) {
  //     _rewardedAd.fullScreenContentCallback = FullScreenContentCallback(
  //       onAdShowedFullScreenContent: (RewardedAd ad) => print('Ad showed.'),
  //       onAdDismissedFullScreenContent: (RewardedAd ad) {
  //         ad.dispose();
  //         setState(() {
  //           _isRewardedAdReady = false;
  //         });
  //         onAdComplete(); // Execute the callback after the ad is dismissed
  //         _loadRewardedAd(); // Load a new ad
  //       },
  //       onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
  //         print('Failed to show ad: $error');
  //         ad.dispose();
  //         setState(() {
  //           _isRewardedAdReady = false;
  //         });
  //         onAdComplete(); // Execute the callback even if the ad fails to show
  //         _loadRewardedAd(); // Load a new ad
  //       },
  //     );
  //     _rewardedAd.show(
  //         onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
  //       print('User earned reward: ${reward.amount} ${reward.type}');
  //     });
  //   } else {
  //     onAdComplete(); // Execute the callback if the ad is not ready
  //   }
  // }

  @override
  void dispose() {
    // _rewardedAd.dispose();
    _bannerAd.dispose();
    super.dispose();
  }

  //AppUpdateInfo? _updateInfo;
  final bool _flexibleUpdateAvailable = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  // Platform messages are asynchronous, so we initialize in an async method.
  // Future<void> checkForUpdate() async {
  //   InAppUpdate.checkForUpdate().then((info) {
  //     setState(() {
  //       _updateInfo = info;
  //     });
  //   }).catchError((e) {
  //     showSnack(e.toString());
  //   });
  // }

  void showSnack(String text) {
    if (_scaffoldKey.currentContext != null) {
      ScaffoldMessenger.of(_scaffoldKey.currentContext!)
          .showSnackBar(SnackBar(content: Text(text)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<ProviderProductsflim>(context);
    final data = dataProvider.fetchDataflim();

    //final provider = Provider.of<Favoriteprovider>(context);

    return UpgradeAlert(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: const Color(0x00000000),
          title: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Adhivideos',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 25),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Wedview1()));
                },
                icon: const Icon(
                  Icons.card_giftcard,
                  color: Colors.green,
                  size: 35,
                ),
              ),
            )
          ],
        ),
        body: RefreshIndicator(
          onRefresh: _refresh,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: dataProvider.dataflim.length,
            itemBuilder: (context, int index) {
              final reverseindex = dataProvider.dataflim.length - 1 - index;
              // final currentItem = dataProvider.data6[reverseindex];
              final words = dataProvider.dataflim[reverseindex];

              return GestureDetector(
                onTap: () {
                  // if (_isRewardedAdReady) {
                  //   _showRewardedAd(() {});
                  // } else {
                  //   // Navigator.push(
                  //   //     context,
                  //   //     MaterialPageRoute(
                  //   //         builder: (context) => SecondPage(
                  //   //             videoUrl: dataProvider.dataflim[reverseindex]
                  //   //                     ['videoshortfilm'] ??
                  //   //                 '')));
                  // }

                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const Videopagedetails()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.black),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(),
                          child: Image.network(
                            dataProvider.dataflim[reverseindex]
                                    ['Imageshortfilm'] ??
                                '',
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Padding(
                            //   padding: const EdgeInsets.all(5.0),
                            //   child: Text(
                            //     ' \₹${dataProvider.dataflim[reverseindex]['price'] ?? '.'}',
                            //     style: TextStyle(
                            //       color: Colors.black,
                            //       fontWeight: FontWeight.w700,
                            //       fontSize: 19.0,
                            //     ),
                            //   ),
                            // ),
                            const SizedBox(width: 10.0),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                dataProvider.dataflim[reverseindex]
                                        ['productUrl'] ??
                                    '',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Colors.white,
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
        persistentFooterButtons: [
          if (_isBannerAdReady)
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: _bannerAd.size.width.toDouble(),
                height: _bannerAd.size.height.toDouble(),
                child: AdWidget(ad: _bannerAd),
              ),
            ),
        ],
      ),
    );
  }
}
