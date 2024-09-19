import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:video_player/video_player.dart';

class FeedItem1 extends StatefulWidget {
  final String videoUrl;
  final String ImageUrl;
  final String VideourlProductUrls;

  const FeedItem1({
    super.key,
    required this.videoUrl,
    //required String imageUrl,
    required this.ImageUrl,
    required this.VideourlProductUrls,
  });

  @override
  State<FeedItem1> createState() => _FeedItemState();
}

class _FeedItemState extends State<FeedItem1> {
  VideoPlayerController? _controller;
  bool _isMuted = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration(seconds: 1), () {
    //   initializePlayer(widget.videoUrl);
    // });
  }

  void initializePlayer(String videoUrl) async {
    final fileInfo = await checkCacheFor(videoUrl);
    if (fileInfo == null) {
      _controller = VideoPlayerController.network(videoUrl);
      _controller!.initialize().then((value) {
        cachedForUrl(videoUrl);
        setState(() {
          _isLoading = false;
          _controller?.setLooping(true);
          _controller?.setVolume(
              _isMuted ? 0.0 : 1.0); // Enable sound, set volume to 1.0
          _controller!.play();
        });
      });
    } else {
      final file = fileInfo.file;
      _controller = VideoPlayerController.file(file);
      _controller!.initialize().then((value) {
        setState(() {
          _isLoading = false;
        });
      });
    }
  }

  // _launchURLApp() async {
  //   var url = Uri.parse(widget.productUrl);
  //   if (await canLaunchUrl(url)) {
  //     await launchUrl(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  Future<FileInfo?> checkCacheFor(String videoUrl) async {
    final FileInfo? value =
        await DefaultCacheManager().getFileFromCache(videoUrl);
    return value;
  }

  void cachedForUrl(String videoUrl) async {
    await DefaultCacheManager().getSingleFile(videoUrl).then((value) {
      print('Downloaded successfully done for $videoUrl');
    });
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
      _controller?.setVolume(_isMuted ? 0.0 : 1.0); // Toggle mute
    });
  }

  void _stopVideo() {
    _controller?.pause(); // Pause the video
  }

  void _togglePause() {
    setState(() {
      if (_controller != null) {
        if (_controller!.value.isPlaying) {
          _controller!.pause(); // Pause the video if it's playing
        } else {
          _controller!.play(); // Play the video if it's paused
        }
      }
    });
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

    return Stack(
      children: [
        if (_controller != null && _controller!.value.isInitialized)
          GestureDetector(
            onTap: _togglePause,
            child: SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller?.value.size.width ?? 0,
                  height: _controller?.value.size.height ?? 0,
                  child: VideoPlayer(_controller!),
                ),
              ),
            ),
          ),
        if (_isLoading) // Display loading indicator while loading
          const Center(
            child: CircularProgressIndicator(),
          ),
        GestureDetector(
          onLongPress: _toggleMute,
          child: Container(
            // Your other content here
            height: 900,
          ),
        ),
        SizedBox(
          height: 600,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Add video control buttons here (e.g., play/pause)
            ],
          ),
        ),
        SizedBox(
          height: 600,
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  '',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  color: Colors.white.withOpacity(0.3),
                  child: GestureDetector(
                    child: Container(
                      height: 45,
                      width: 180,
                      child: Center(
                        child: Text(
                          'See this fit',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                    // onTap: () {
                    //   showModalBottomSheet(
                    //       context: context,
                    //       builder: (BuildContext Context) {
                    //         return ProductList(
                    //           image1: widget.imageUrl,
                    //           productUrl: widget.productUrl,
                    //         );
                    //       });
                    // },
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              const Column(
                children: [
                  Expanded(child: SizedBox()),
                  Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.white,
                    size: 32,
                  ),
                  Text(
                    '25.6k',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Icon(
                    Icons.message,
                    color: Colors.white,
                    size: 32,
                  ),
                  Text('12k', style: TextStyle(color: Colors.white)),
                  SizedBox(
                    height: 70,
                  ),
                  Icon(
                    Icons.share,
                    color: Colors.white,
                    size: 32,
                  ),
                  Text('19k', style: TextStyle(color: Colors.white)),
                  SizedBox(
                    height: 150,
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 900,
          child: GestureDetector(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                  child: Container(
                    color: Colors.white.withOpacity(0.6),
                    child: Container(
                      height: 100,
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '   see this fit',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(color: Colors.white, fontSize: 13),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SizedBox(
                                height: 70,
                                width: 50,
                                child: Image.network(
                                  widget.ImageUrl,
                                  fit: BoxFit.cover,
                                ), // Use widget.urls for the image URL
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // onTap: () {
            //   showModalBottomSheet(
            //       context: context,
            //       builder: (BuildContext Context) {
            //         return ProductList(
            //           image1: widget.imageUrl,
            //           productUrl: widget.productUrl,
            //         );
            //       });
            // },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
