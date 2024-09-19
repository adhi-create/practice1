import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:providerpractice/Homepagecategory/Marketplace/marketplace.dart';
import 'package:providerpractice/Homepagecategory/shownowpages/Bangleshomepage.dart';
import 'package:providerpractice/Homepagecategory/shownowpages/earingshomepage.dart';
import 'package:providerpractice/Homepagecategory/shownowpages/vadanaluhome.dart';
import 'package:providerpractice/VideoSreen/favoritepage1.dart';
import 'package:providerpractice/authentication/features/user_auth/presentation/pages/home_page.dart';
import 'package:url_launcher/url_launcher.dart';

class Homepagecatogery extends StatefulWidget {
  const Homepagecatogery({super.key});

  @override
  State<Homepagecatogery> createState() => _HomepagecatogeryState();
}

class _HomepagecatogeryState extends State<Homepagecatogery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Center(
          child: Text(
            'Home',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => profilepage()));
              },
              icon: const Icon(
                EneftyIcons.profile_circle_bold,
                size: 35,
                color: Colors.red,
              ))
        ],
        // title: Row(
        //   children: [
        //     // IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        //     // SizedBox(
        //     //   width: 100,
        //     // ),
        //     Text(
        //       'Home',
        //       style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        //     ),
        //   ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                '  Aswini jewellery ',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: GestureDetector(
                  onTap: () {
                    _launchURL();
                  },
                  child: SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Image.asset('assets/pink.png', fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                '  Shop Now',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MyHomePag()));
                          },
                          child: SizedBox(
                            height: 200,
                            width: 180,
                            child: Center(
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      'assets/necklesspink.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: const Text(
                                      ' ',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Earingshomepage()));
                          },
                          child: SizedBox(
                            height: 200,
                            width: 180,
                            child: Center(
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      'assets/earringspink.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: const Text(
                                      ' ',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Bangleshomepage()));
                      },
                      child: SizedBox(
                        height: 200,
                        width: 180,
                        child: Center(
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  'assets/banglepink.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: const Text(
                                  ' ',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Vadanaluhome()));
                          },
                          child: SizedBox(
                            height: 200,
                            width: 180,
                            child: Center(
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      'assets/vadanampink.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: const Text(
                                      ' ',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            // Container(
            //   alignment: Alignment.topLeft,
            //   child: const Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Text(
            //       'categorys',
            //       style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         fontSize: 25.0,
            //       ),
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 20,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Container(
            //       height: 168,
            //       width: 120,
            //       decoration: BoxDecoration(
            //           color: Color(0xFFFFD700),
            //           borderRadius: BorderRadius.circular(8.0)),
            //       child: Padding(
            //         padding: const EdgeInsets.fromLTRB(0, 140, 0, 10),
            //         child: Container(
            //           color: Colors.red,
            //           child: Center(
            //             child: Text(
            //               'hello',
            //               style: TextStyle(
            //                   fontSize: 16.0, fontWeight: FontWeight.bold),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //     Container(
            //       height: 168,
            //       width: 120,
            //       decoration: BoxDecoration(
            //           color: Color(0xFFFFD700),
            //           borderRadius: BorderRadius.circular(10.0)),
            //       child: Padding(
            //         padding: const EdgeInsets.fromLTRB(0, 140, 0, 10),
            //         child: Container(
            //           color: Colors.red,
            //           child: Center(
            //             child: Text(
            //               'hello',
            //               style: TextStyle(
            //                   fontSize: 16.0, fontWeight: FontWeight.bold),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //     Container(
            //       height: 168,
            //       width: 120,
            //       decoration: BoxDecoration(
            //           color: Color(0xFFFFD700),
            //           borderRadius: BorderRadius.circular(10.0)),
            //       child: Padding(
            //         padding: const EdgeInsets.fromLTRB(0, 140, 0, 10),
            //         child: Container(
            //           color: Colors.red,
            //           child: Center(
            //             child: Text(
            //               'hello',
            //               style: TextStyle(
            //                   fontSize: 16.0, fontWeight: FontWeight.bold),
            //             ),
            //           ),
            //         ),
            //       ),
            //     )
            //   ],
            // ),
            const SizedBox(
              height: 10.0,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Container(
            //       height: 168,
            //       width: 120,
            //       decoration: BoxDecoration(
            //         color: Color(0xFFFFD700),
            //         borderRadius: BorderRadius.circular(10.0),
            //       ),
            //       child: Padding(
            //         padding: const EdgeInsets.fromLTRB(0, 140, 0, 10),
            //         child: Container(
            //           color: Colors.red,
            //           child: Center(
            //             child: Text(
            //               'hello',
            //               style: TextStyle(
            //                   fontSize: 16.0, fontWeight: FontWeight.bold),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //     Container(
            //       height: 168,
            //       width: 120,
            //       decoration: BoxDecoration(
            //           color: Color(0xFFFFD700),
            //           borderRadius: BorderRadius.circular(10.0)),
            //       child: Padding(
            //         padding: const EdgeInsets.fromLTRB(0, 140, 0, 10),
            //         child: Container(
            //           color: Colors.red,
            //           child: Center(
            //             child: Text(
            //               'hello',
            //               style: TextStyle(
            //                   fontSize: 16.0, fontWeight: FontWeight.bold),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //     Container(
            //       height: 168,
            //       width: 120,
            //       decoration: BoxDecoration(
            //           color: Color(0xFFFFD700),
            //           borderRadius: BorderRadius.circular(10.0)),
            //       child: Padding(
            //         padding: const EdgeInsets.fromLTRB(0, 140, 0, 10),
            //         child: Container(
            //           color: Colors.red,
            //           child: Center(
            //             child: Text(
            //               'hello',
            //               style: TextStyle(
            //                   fontSize: 16.0, fontWeight: FontWeight.bold),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            const SizedBox(
              height: 8,
            ),
            Stack(
              children: [
                Container(
                  child: Image.asset('assets/whastappdesign.png'),
                ),
                GestureDetector(
                  onTap: () {
                    _launchURL();
                  },
                  child: SizedBox(
                    height: 200,
                    width: 400,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'offer Zoon',
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              width: 400,
              color: Colors.pinkAccent,
              child: const Center(
                  child: Text(
                'fashion add on',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 27.0,
                    color: Colors.white),
              )),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}

_launchURL() async {
  const url = 'https://wa.link/p8q78b';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
