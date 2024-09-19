import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubeLiveScreen extends StatefulWidget {
  final String videoId;
  final String whatsapp;

  const YouTubeLiveScreen(
      {super.key, required this.videoId, required this.whatsapp});

  @override
  _YouTubeLiveScreenState createState() => _YouTubeLiveScreenState();
}

class _YouTubeLiveScreenState extends State<YouTubeLiveScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize the YoutubePlayerController with the liveStreamId.
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        isLive: true,
      ),
    );
  }

  static Future<void> sendMessageOnWhatsApp(whatsapp) async {
    final number = whatsapp;
    final message = 'hello';

    final url = 'https://wa.me/$number?text=${Uri.encodeComponent(message)}';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double videoHeight = screenHeight * (16 / 9);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
      ),
      body: Stack(
        children: [
          // YouTube Player

          SizedBox(
            height: videoHeight,
            width: screenWidth,
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              onReady: () {
                _controller.addListener(() {
                  if (_controller.value.isPlaying) {
                    setState(() {
                      _controller.value.position.inSeconds.toDouble() /
                          _controller.metadata.duration.inSeconds.toDouble();
                    });
                  }
                });
              },
            ),
          ),

          // Positioned(
          //   left: screenWidth * 0.8,
          //   top: screenHeight * 0.6,
          //   child: Container(
          //     decoration: BoxDecoration(
          //         color: Colors.white.withOpacity(0.5),
          //         borderRadius: BorderRadius.circular(20)),
          //     height: 70,
          //     width: 70,
          //     child: IconButton(
          //         onPressed: () {},
          //         icon: Icon(
          //           Icons.screenshot,
          //           size: 35,
          //           color: Colors.white,
          //         )),
          //   ),
          // ),

          Positioned(
            right: screenWidth * 0.8,
            top: screenHeight * 0.0,
            child: Container(
              height: 70,
              width: 70,
              child: ClipRRect(
                child: Image.asset('assets/live.png'),
              ),
            ),
          ),

          // Positioned Button for Bottom Sheet
          // Positioned(
          //   left: screenWidth * 0.6, // 70% from the left
          //   top: screenHeight * 0.7, // 80% from the top
          //   child: GestureDetector(
          //     onTap: () {
          //   showModalBottomSheet(
          //     context: context,
          //     builder: (BuildContext context) {
          //       return Container(
          //         height: 400,
          //         color: Colors.white,
          //         child: Center(
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             mainAxisSize: MainAxisSize.min,
          //             children: <Widget>[
          //               const Text('Modal BottomSheet'),
          //               Container(
          //                 height: 80,
          //                 width: 300,
          //                 color: Colors.green,
          //                 child: Row(
          //                   children: [
          //                     Icon(
          //                       Boxicons.bxl_whatsapp,
          //                       size: 60,
          //                       color: Colors.white,
          //                     ),
          //                     Text(
          //                       'Whatsapp',
          //                       style: TextStyle(
          //                           fontSize: 30, color: Colors.white),
          //                     )
          //                   ],
          //                 ),
          //               ),
          //               SizedBox(
          //                 height: 10,
          //               ),
          //               ElevatedButton(
          //                 child: const Text('Close BottomSheet'),
          //                 onPressed: () => Navigator.pop(context),
          //               ),
          //             ],
          //           ),
          //         ),
          //       );
          //     },
          //   );
          // },
          //     child: Container(
          //       color: Colors.green,
          //       // color: Colors.white.withOpacity(0.6),
          //       height: 100,
          //       width: 150,
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             '   See this fit',
          //             style: Theme.of(context)
          //                 .textTheme
          //                 .displaySmall
          //                 ?.copyWith(color: Colors.white, fontSize: 13),
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.all(10.0),
          //             child: Icon(
          //               Boxicons.bxl_whatsapp,
          //               size: 60,
          //               color: Colors.white,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
      floatingActionButton: Container(
        height: 80,
        width: 80,
        child: FittedBox(
          child: FloatingActionButton(
              onPressed: () async {
                sendMessageOnWhatsApp(widget.whatsapp);
                // showModalBottomSheet(
                //   context: context,
                //   builder: (BuildContext context) {
                //     return Container(
                //       height: 400,
                //       color: Colors.white,
                //       child: Center(
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           crossAxisAlignment: CrossAxisAlignment.center,
                //           mainAxisSize: MainAxisSize.min,
                //           children: <Widget>[
                //             const Text(
                //               'Click order',
                //               style: TextStyle(fontSize: 30),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.all(30),
                //               child: Container(
                //                 height: 80,
                //                 width: 300,
                //                 decoration: BoxDecoration(
                //                     color: Colors.green,
                //                     borderRadius: BorderRadius.circular(30)),
                //                 child: Row(
                //                   children: [
                //                     Icon(
                //                       Boxicons.bxl_whatsapp,
                //                       size: 60,
                //                       color: Colors.white,
                //                     ),
                //                     Text(
                //                       'Whatsapp',
                //                       style: TextStyle(
                //                           fontSize: 30, color: Colors.white),
                //                     ),
                //                     Container(
                //                       decoration: BoxDecoration(
                //                           color: Colors.amber,
                //                           borderRadius:
                //                               BorderRadius.circular(20)),
                //                       child: Text(
                //                         ' Order ',
                //                         style: TextStyle(
                //                             fontSize: 30, color: Colors.white),
                //                       ),
                //                     )
                //                   ],
                //                 ),
                //               ),
                //             ),
                //             SizedBox(
                //               height: 10,
                //             ),
                //             // IconButton(
                //             //   icon: Icon(
                //             //     Icons.cancel,
                //             //     size: 40,
                //             //   ),
                //             //   onPressed: () => Navigator.pop(context),
                //             // ),
                //           ],
                //         ),
                //       ),
                //     );
                //   },
                // );
              },
              backgroundColor: Colors.green,
              child: Icon(
                Boxicons.bxl_whatsapp,
                color: Colors.white,
                size: 40,
              )),
        ),
      ),
    );
  }
}
