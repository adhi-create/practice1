import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:providerpractice/animationplayercontroll.dart';
import 'package:video_player/video_player.dart';
import 'package:flick_video_player/flick_video_player.dart';

class SecondPage extends StatelessWidget {
  final String videoUrl;

  const SecondPage({super.key, required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          '',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.black, // Customize the app bar color
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.grey.withOpacity(0.5),
                //     spreadRadius: 5,
                //     blurRadius: 7,
                //     offset: Offset(0, 3),
                //   ),
                // ],
              ),
              child: VideoPlayerScreen(videoUrl: videoUrl),
            ),
            const SizedBox(height: 20),
            FloatingActionButton(
              onPressed: () {},
              // child: Icon(
              //   Icons.share,
              //   color: Colors.white,
              // ),
              backgroundColor: Colors.black, // Customize the button color
            ),
          ],
        ),
      ),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerScreen({super.key, required this.videoUrl});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(widget.videoUrl),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 9 / 16,
        child: FlickVideoPlayer(
          flickManager: flickManager,
          //flickVideoWithControls: AnimationPlayerPortraitVideoControls(),

          // preferredDeviceOrientationFullscreen: [
          //   DeviceOrientation.portraitUp,
          //   DeviceOrientation.landscapeLeft,
          //   DeviceOrientation.landscapeRight,
          // ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }
}
