import 'package:enefty_icons/enefty_icons.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:providerpractice/Homepagecategory/homepagecategory.dart';
import 'package:providerpractice/Listview/ListView.dart';
import 'package:providerpractice/Homepagecategory/Marketplace/marketplace.dart';
import 'package:providerpractice/Homepagecategory/Marketplace/marketplaceopeningpage.dart';
import 'package:providerpractice/Homepagecategory/Marketplace/wedview/wedview.dart';
import 'package:providerpractice/Homepagecategory/Marketplace/whatsAppscreen/whatsappscreen.dart';

//import 'package:movieappmarket/Offers/MarketplaceMain.dart';
//import 'package:movieappmarket/Offers/HomePage2.dart';
//import 'package:movieappmarket/Offers/OfferListeView.dart';
//import 'package:movieappmarket/Offers/TshirtListeView.dart';
//import 'package:movieappmarket/VideoSreen/APiListeView.dart';

import 'package:providerpractice/MyHomepage/myhome.dart';
import 'package:providerpractice/ProductsListPage/MyHomePage.dart';
import 'package:providerpractice/Homepagecategory/Provider/providerProduct.dart';

import 'package:providerpractice/VideoSreen/MyHomePage.dart';
import 'package:providerpractice/VideoSreen/Provider.dart';
import 'package:providerpractice/VideoSreen/Provider/providerProduct.dart';
import 'package:providerpractice/VideoSreen/favoritepage1.dart';
import 'package:providerpractice/VideoSreen/videolist.dart';
import 'package:providerpractice/authentication/authenticationpage.dart';

import 'package:providerpractice/authentication/openingPage.dart';
import 'package:providerpractice/dempfirebade.dart';
import 'package:providerpractice/livesales/listlive.dart';
import 'package:providerpractice/livesales/provider.dart';

import 'package:providerpractice/reelPage/setPage.dart';
import 'package:providerpractice/settingpagdemo.dart';

import 'package:providerpractice/settingpage/settingpage.dart';
import 'package:providerpractice/storieshomepage/Homepage.dart';
import 'package:providerpractice/videoscreen/videoscreen.dart';
import 'package:providerpractice/viewcount.dart/viewcount.dart';
//import 'package:movieappmarket/SettingsPage/SettingsPage.dart';
//import 'package:movieappmarket/menu/menuPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyA7-p2bVwNBhnqj3IKPLwmEyZzCNMDYeWQ",
        appId: "1:991631480359:web:6c27049271a73f8ad7a002",
        messagingSenderId: "991631480359",
        projectId: "demoapi-1b3d9",
        // Your web Firebase config options
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, Key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          // ChangeNotifierProvider(
          //   create: (context) => ProviderProducts(),
          // ),
          // ChangeNotifierProvider(
          //   create: (context) => ProviderProducts2(),
          // ),
          ChangeNotifierProvider(
            create: (context) => ProviderProductsflim(),
          ),
          ChangeNotifierProvider(
            create: (context) => ProviderProducts4(),
          ),
          ChangeNotifierProvider(
            create: (context) => ProviderProductscate5(),
          ),
          ChangeNotifierProvider(
            create: (context) => ProviderProducts6(),
          ),
          ChangeNotifierProvider(
            create: (context) => ProviderProducts7(),
          ),
          ChangeNotifierProvider(
            create: (context) => ProviderProducts8(),
          ),
          ChangeNotifierProvider(
            create: (context) => ProviderProducts9(),
          ),
          ChangeNotifierProvider(
            create: (context) => ProviderProductsfav(),
          ),
          ChangeNotifierProvider(
            create: (context) => VideoProviderProducts(),
          ),
          ChangeNotifierProvider(
            create: (context) => VideoProviderProducts2(),
          ),
          ChangeNotifierProvider(
            create: (context) => VideoProviderProducts3(),
          ),
          ChangeNotifierProvider(
            create: (context) => videoProviderProducts4(),
          ),
          ChangeNotifierProvider(
            create: (context) => VideoProviderProductscate5(),
          ),
          ChangeNotifierProvider(
            create: (context) => Favoriteprovider(),
          ),
          ChangeNotifierProvider(
            create: (context) => ProductProviderlive(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: debugDisableShadows,
          title: 'Flutter Demo',
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
                shadowColor: Colors.white, backgroundColor: Colors.white),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            useMaterial3: true,
          ),
          home: HomePageVideo(),
        ));
  }
}

// class splashScreen extends StatefulWidget {
//   const splashScreen({super.key});

//   @override
//   State<splashScreen> createState() => _splashScreenState();
// }

// class _splashScreenState extends State<splashScreen> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Future.delayed(Duration(seconds: 1), () {
//       // Navigate to the next screen after the splash screen
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (context) => HomePageVideo()),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Center(
//         child: Image.asset('assets/photo.png'),
//       ),
//     );
//   }
// }

class HomePageVideo extends StatefulWidget {
  const HomePageVideo({super.key, Key});

  @override
  State<HomePageVideo> createState() => _HomePageVideoState();
}

class _HomePageVideoState extends State<HomePageVideo> {
  int _index = 0;

  List<Widget> WidgetListe = [
    Listlive(),
    Listlive(),
    const Wedview(),

    // LivewHomePage(title: 'hhhh'),
    //setPage()

    //setPage()
    const OpeningPage()
  ];

  //bool _isAdsLoad = false;

  BannerAd? _bannerAd;

  @override
  void initState() {
    super.initState();
    _bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: '',
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {});
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
      request: const AdRequest(),
    )..load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: WidgetListe[_index],
        ),
      ),
      // persistentFooterButtons: [
      //   if (_bannerAd != null)
      //     Container(
      //       width: _bannerAd!.size.width.toDouble(),
      //       height: _bannerAd!.size.height.toDouble(),
      //       child: AdWidget(ad: _bannerAd!),
      //     ),
      // ],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // Fixed
          backgroundColor: Colors.white, // <-- This works for fixed
          unselectedItemColor: _index == 1 ? Colors.grey : Colors.grey,
          selectedItemColor: _index == 1 ? Colors.pink : Colors.pink,
          currentIndex: _index,
          onTap: (index) {
            setState(() {
              _index = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                EneftyIcons.home_bold,
                size: 30,
              ),
              backgroundColor: Colors.white,
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                EneftyIcons.heart_bold,
                size: 30,
              ),
              backgroundColor: Colors.white,
              label: 'Favorite ',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                EneftyIcons.video_bold,
                size: 30,
              ),
              backgroundColor: Colors.white,
              label: 'Videos',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                EneftyIcons.setting_2_bold, size: 30,
                //color: Colors.black,
              ),
              backgroundColor: Colors.white,
              label: 'Settings',
            )
          ]),
    );
  }
}
