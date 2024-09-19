import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:providerpractice/reelPage/player.dart';

class Videopagedetails extends StatefulWidget {
  final String adhiId;
  final String image;

  final String longdescription;
  final String firstepisode;
  final String writer;
  final String title;

  const Videopagedetails({
    super.key,
    required this.adhiId,
    required this.image,
    required this.writer,
    required this.longdescription,
    required this.firstepisode,
    required this.title,
  });

  @override
  State<Videopagedetails> createState() => _VideopagedetailsState();
}

class _VideopagedetailsState extends State<Videopagedetails> {
  InterstitialAd? _interstitialAd;
  bool _isAdLoaded = false;
  int _clickCount = 0;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _loadInterstitialAd();
  }

  // Load Interstitial Ad
  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/1033173712', // Test ad unit ID
      request: AdRequest(),
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

  // Show Interstitial Ad
  void _showInterstitialAd(String videoUrl, title, image) {
    if (_isAdLoaded && _interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          ad.dispose();
          _loadInterstitialAd(); // Load another ad after current one is dismissed
          // Navigate to the FeedItem after the ad is dismissed
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  FeedItem(title: title, image: image, videoUrl: videoUrl),
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
              FeedItem(title: title, image: image, videoUrl: videoUrl),
        ),
      );
    }
  }

  // Future<void> fetchViewCount() async {
  //   DocumentSnapshot snapshot = await _firestore
  //       .collection('demo')
  //       .doc(widget.adhiId)
  //       .collection('love')
  //       .doc()
  //       .get();
  //   if (snapshot.exists) {
  //     setState(() {
  //       _clickCount = snapshot['counts'] ?? 0;
  //     });
  //   }
  // }

  // Increment the click count and update Firebase
  Future<void> _incrementClickCount(
    String document,
  ) async {
    setState(() {
      _clickCount++;
    });

    // Save the updated click count to Firestore
    await _firestore
        .collection('demo')
        .doc(widget.adhiId)
        .collection('love')
        .doc(document)
        .set({
      'counts': FieldValue.increment(1),
    }, SetOptions(merge: true));
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }

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
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 30,
              color: Colors.black,
            ),
            Stack(
              children: [
                ShaderMask(
                  shaderCallback: (bounds) => RadialGradient(
                    center: Alignment.center,
                    radius: 1.0,
                    colors: [
                      Colors.black87,
                      Colors.transparent,
                    ],
                    stops: [0.6, 1.0],
                  ).createShader(bounds),
                  blendMode: BlendMode.darken,
                  child: Image.network(
                    widget.image,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      widget.image,
                      height: 300,
                      width: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Text(
                    widget.writer,
                    style: const TextStyle(fontSize: 17, color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text(
                    widget.title,
                    style:
                        GoogleFonts.oswald(color: Colors.black, fontSize: 25),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 70,
                  width: 300,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 210, 210, 207),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildRatingAndEpisodes('4.5', Icons.star),
                      _buildDivider(),
                      _buildRatingAndEpisodes('10', 'ep'),
                      _buildDivider(),
                      _buildRatingAndEpisodes('3.7k', 'daily'),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            _buildPlayButtons(),
            _buildDescription(),
            Container(
              height: _bannerAd.size.height.toDouble(),
              width: _bannerAd.size.width.toDouble(),
              child: AdWidget(ad: _bannerAd),
            ),
            const SizedBox(height: 30),
            Container(
              height: 3,
              color: Colors.grey[300],
            ),
            _buildEpisodes(),
            const SizedBox(height: 10),
            _buildEpisodesList(),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingAndEpisodes(String text, dynamic iconOrLabel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        iconOrLabel is IconData
            ? Icon(iconOrLabel, color: Colors.black)
            : Text(iconOrLabel),
      ],
    );
  }

  Widget _buildDivider() {
    return const Text('|', style: TextStyle(fontSize: 25));
  }

  Widget _buildPlayButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildPlayButton(
          label: 'Play Ep1',
          color: Colors.white,
          textColor: Colors.black,
          borderColor: const Color.fromARGB(255, 255, 134, 59),
          onPressed: () {
            // Handle play Ep1 button press
          },
        ),
        _buildPlayButton(
          label: 'Play Ep1',
          color: Colors.yellow[900]!,
          textColor: Colors.white,
          onPressed: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => FeedItem(

            //               videoUrl: widget.firstepisode,
            //             )));
          },
        ),
      ],
    );
  }

  Widget _buildPlayButton({
    required String label,
    required Color color,
    required Color textColor,
    Color? borderColor,
    IconData? icon,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60,
        width: 170,
        decoration: BoxDecoration(
          color: color,
          border: borderColor != null ? Border.all(color: borderColor) : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) Icon(icon, color: textColor, size: 30),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Text(
        widget.longdescription,
        style: TextStyle(fontSize: 15),
      ),
    );
  }

  Widget _buildEpisodes() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Episodes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 100,
            height: 3,
            color: Colors.yellow[900],
          ),
        ],
      ),
    );
  }

  Widget _buildEpisodesList() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('demo')
          .doc(widget.adhiId)
          .collection('love')
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final List<QueryDocumentSnapshot> documents = snapshot.data!.docs;

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: documents.length,
          itemBuilder: (context, index) {
            final document = documents[index];
            final data = documents[index].data() as Map<String, dynamic>;

            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: () {
                  _incrementClickCount(document.id);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => FeedItem(videoUrl: data['video']),
                  //   ),
                  // );
                  _showInterstitialAd(
                      data['video'], data['love'], data['image']);
                },
                child: Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            data['image'],
                            height: 100,
                            width: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          data['love'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),

                  // onTap: () {
                  //   _incrementClickCount(document.id);
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => FeedItem(videoUrl: data['video']),
                  //     ),
                  //   );
                  // },
                  // leading: ClipRRect(
                  //   borderRadius: BorderRadius.circular(10),
                  //   child: Image.network(
                  //     data['image'],
                  //     height: 150,
                  //     width: 100,
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                  // title: Text(
                  //   data['love'],
                  //   style: const TextStyle(fontWeight: FontWeight.bold),
                  // ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
