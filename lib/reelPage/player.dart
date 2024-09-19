import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:video_player/video_player.dart';

class FeedItem extends StatefulWidget {
  final String videoUrl;
  final String title;
  final String image;

  const FeedItem({
    Key? key,
    required this.videoUrl,
    required this.title,
    required this.image,
  }) : super(key: key);

  @override
  State<FeedItem> createState() => _FeedItemState();
}

class _FeedItemState extends State<FeedItem> {
  VideoPlayerController? _controller;
  bool _isMuted = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    initializePlayer(widget.videoUrl);
  }

  void initializePlayer(String videoUrl) async {
    final fileInfo = await checkCacheFor(videoUrl);
    if (fileInfo == null) {
      _controller = VideoPlayerController.network(videoUrl);
    } else {
      final file = fileInfo.file;
      _controller = VideoPlayerController.file(file);
    }

    _controller?.initialize().then((_) {
      setState(() {
        _isLoading = false;
        _controller?.setLooping(true);
        _controller?.setVolume(_isMuted ? 0.0 : 1.0);
        _controller?.play();
      });

      if (fileInfo == null) {
        cacheForUrl(videoUrl);
      }
    }).catchError((error) {
      setState(() {
        _isLoading = false;
      });
      print("Error initializing video player: $error");
    });
  }

  Future<FileInfo?> checkCacheFor(String videoUrl) async {
    return await DefaultCacheManager().getFileFromCache(videoUrl);
  }

  void cacheForUrl(String videoUrl) async {
    await DefaultCacheManager().getSingleFile(videoUrl).then((value) {
      print('Downloaded successfully for $videoUrl');
    });
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
      _controller?.setVolume(_isMuted ? 0.0 : 1.0);
    });
  }

  void _togglePause() {
    setState(() {
      _controller!.value.isPlaying ? _controller!.pause() : _controller!.play();
    });
  }

  void _skipForward() {
    final currentPosition = _controller!.value.position;
    final duration = _controller!.value.duration;
    final newPosition = currentPosition + const Duration(seconds: 5);

    _controller?.seekTo(newPosition < duration ? newPosition : duration);
  }

  void _skipBackward() {
    final currentPosition = _controller!.value.position;
    final newPosition = currentPosition - const Duration(seconds: 5);

    _controller
        ?.seekTo(newPosition > Duration.zero ? newPosition : Duration.zero);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          if (_controller != null && _controller!.value.isInitialized)
            GestureDetector(
              child: SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Column(
                    children: [
                      SizedBox(
                        width: _controller?.value.size.width ?? 0,
                        height: _controller?.value.size.height ?? 0,
                        child: VideoPlayer(_controller!),
                      ),
                      Container(
                        color: Colors.black,
                        height: 215,
                        width: 1060,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 550, 0, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 18,
                          width: 1000,
                          child: VideoProgressIndicator(
                            _controller!,
                            allowScrubbing: true,
                            colors: const VideoProgressColors(
                              playedColor: Color(0xFFF57F12),
                              backgroundColor: Colors.grey,
                              bufferedColor: Colors.white54,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.black,
                        width: 1060,
                        height: 330,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          if (_isLoading) const Center(child: CircularProgressIndicator()),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 500, 0, 0),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 50,
                  width: 50,
                  child: Image.network(widget.image),
                ),
                const SizedBox(width: 15),
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 600, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: _skipBackward,
                    icon: const Icon(EneftyIcons.undo_outline,
                        color: Colors.white, size: 30),
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    onPressed: _togglePause,
                    icon: Icon(
                      _controller?.value.isPlaying ?? false
                          ? Icons.pause
                          : Icons.play_arrow,
                      color: Colors.white,
                      size: 70,
                    ),
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    onPressed: _skipForward,
                    icon: const Icon(EneftyIcons.redo_outline,
                        color: Colors.white, size: 30),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
