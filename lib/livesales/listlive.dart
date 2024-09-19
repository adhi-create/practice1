import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:providerpractice/livesales/provider.dart';
import 'package:providerpractice/livesales/youtudelivescreen.dart';
import 'package:upgrader/upgrader.dart';

class Listlive extends StatefulWidget {
  const Listlive({super.key});

  @override
  State<Listlive> createState() => _ListliveState();
}

class _ListliveState extends State<Listlive> {
  late BannerAd _bannerAd;
  InterstitialAd? _interstitialAd;
  bool _isAdLoaded = false;
  bool _isBannerAdReady = false;

  @override
  void initState() {
    super.initState();
    final dataProvider =
        Provider.of<ProductProviderlive>(context, listen: false);
    dataProvider.fetchProducts();
    _loadBannerAd();
    _loadInterstitialAd();
  }

  void _loadBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: '', // Test ad unit ID
      request: const AdRequest(),
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
    _bannerAd.load();
  }

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: '', // Test ad unit ID
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
          _isAdLoaded = true;
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('InterstitialAd failed to load: $error');
          _isAdLoaded = false;
        },
      ),
    );
  }

  void _showInterstitialAd(String videoUrl, whatsapp) {
    if (_isAdLoaded && _interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          ad.dispose();
          _loadInterstitialAd(); // Load another ad after the current one is dismissed
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => YouTubeLiveScreen(
                videoId: videoUrl,
                whatsapp: whatsapp,
              ),
            ),
          );
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          ad.dispose();
          print('Failed to show interstitial ad: $error');
          _loadInterstitialAd(); // Reload the ad
        },
      );
      _interstitialAd!.show();
    } else {
      // If the ad is not loaded, just navigate to the next screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              YouTubeLiveScreen(whatsapp: whatsapp, videoId: videoUrl),
        ),
      );
    }
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    _bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<ProductProviderlive>(context);

    return UpgradeAlert(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            backgroundColor: Colors.amber,
            title: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Live Sale',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            actions: [
              Image.asset('assets/live.png'),
            ],
          ),
        ),
        body: dataProvider.products.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: dataProvider.products.length,
                itemBuilder: (context, int index) {
                  final reverseindex = dataProvider.products.length - 1 - index;

                  final product = dataProvider.products[reverseindex];
                  return GestureDetector(
                    onTap: () {
                      _showInterstitialAd(product.name, product.whatsap);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(20)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            product.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
        bottomNavigationBar: _isBannerAdReady
            ? Container(
                height: _bannerAd.size.height.toDouble(),
                width: _bannerAd.size.width.toDouble(),
                child: AdWidget(ad: _bannerAd),
              )
            : SizedBox.shrink(),
      ),
    );
  }
}
