import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class myhome extends StatefulWidget {
  const myhome({super.key});

  @override
  State<myhome> createState() => _myhomeState();
}

class _myhomeState extends State<myhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarouselSlider(
        items: [
          // Replace these with your carousel items (e.g., images or widgets)
          SizedBox(
            child: Center(
                child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/curd-99500.appspot.com/o/Pink%20and%20Blue%20Modern%20Fashion%20Banner.png?alt=media&token=19a44e48-1379-40c5-a679-a17951ab308b',
              fit: BoxFit.cover,
            )),
          ),
          SizedBox(
            child: Center(
                child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/curd-99500.appspot.com/o/21woman.jpg?alt=media&token=43229ffa-2b3f-4e53-bf67-3321ad76cba8',
              fit: BoxFit.cover,
            )),
          ),
          SizedBox(
            child: Center(
                child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/curd-99500.appspot.com/o/Blue%20Dynamic%20Fashion%20Special%20Sale%20Banner.png?alt=media&token=36df4693-e314-4386-be66-c17ffe25a804',
              fit: BoxFit.cover,
            )),
          ),
        ],
        options: CarouselOptions(
          height: 200,
          // Adjust the height as needed
          viewportFraction: 1.0, // Adjust the item width
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastLinearToSlowEaseIn,
          //enlargeCenterPage: true,
          scrollDirection:
              Axis.horizontal, // Use Axis.vertical for a vertical carousel
        ),
      ),
      // SizedBox(
      //   child: Categories(),
      // ),

      // Padding(
      //   padding: EdgeInsets.symmetric(horizontal: 20),
      //   child: SectionTitle(
      //     title: "Special for you",
      //     press: () {
      //       Navigator.push(context,
      //           MaterialPageRoute(builder: (context) => ListView()));
      //     },
      //   ),
      // ),

      // SingleChildScrollView(
      //   scrollDirection: Axis.horizontal,
      //   child: Row(
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.all(7.0),
      //         child: GestureDetector(
      //           onTap: () {
      //             Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                     builder: (context) => PlayerController()));
      //           },
      //           child: GestureDetector(
      //             onTap: () {
      //               Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (context) => PlayerController()));
      //             },
      //             child: Container(
      //               height: 200,
      //               width: 120,
      //               color: Colors.amber,
      //               child: Image.network(
      //                 'https://firebasestorage.googleapis.com/v0/b/curd-99500.appspot.com/o/photo_5766143064493109616_w%202.jpg?alt=media&token=4030e108-1757-440f-a8cf-93920feaf3f2',
      //                 fit: BoxFit.cover,
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(5.0),
      //         child: GestureDetector(
      //           onTap: () {
      //             Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                     builder: (context) => PlayerController()));
      //           },
      //           child: Container(
      //             height: 200,
      //             width: 120,
      //             color: Colors.amber,
      //             child: Image.network(
      //               'https://firebasestorage.googleapis.com/v0/b/curd-99500.appspot.com/o/photo_5766143064493109616_w%202.jpg?alt=media&token=4030e108-1757-440f-a8cf-93920feaf3f2',
      //               fit: BoxFit.cover,
      //             ),
      //           ),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(7.0),
      //         child: GestureDetector(
      //           onTap: () {
      //             Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                     builder: (context) => PlayerController()));
      //           },
      //           child: Container(
      //             height: 200,
      //             width: 120,
      //             color: Colors.amber,
      //             child: Image.network(
      //               'https://firebasestorage.googleapis.com/v0/b/curd-99500.appspot.com/o/photo_5766143064493109616_w%202.jpg?alt=media&token=4030e108-1757-440f-a8cf-93920feaf3f2',
      //               fit: BoxFit.cover,
      //             ),
      //           ),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(7.0),
      //         child: GestureDetector(
      //           onTap: () {
      //             Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                     builder: (context) => PlayerController()));
      //           },
      //           child: Container(
      //             height: 200,
      //             width: 120,
      //             color: Colors.amber,
      //             child: Image.network(
      //               'https://firebasestorage.googleapis.com/v0/b/curd-99500.appspot.com/o/photo_5766143064493109616_w%202.jpg?alt=media&token=4030e108-1757-440f-a8cf-93920feaf3f2',
      //               fit: BoxFit.cover,
      //             ),
      //           ),
      //         ),
      //       )
      //     ],
      //   ),
      // ),
      // Padding(
      //   padding: EdgeInsets.symmetric(horizontal: 20),
      //   child: SectionTitle(
      //     title: "Special for you",
      //     press: () {
      //       Navigator.push(context,
      //           MaterialPageRoute(builder: (context) => ListView()));
      //     },
      //   ),
      // ),
      // SizedBox(
      //   height: 10,
      // ),
      // SingleChildScrollView(
      //   scrollDirection: Axis.horizontal,
      //   child: Row(
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.all(7.0),
      //         child: GestureDetector(
      //           onTap: () {
      //             Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                     builder: (context) => PlayerController()));
      //           },
      //           child: GestureDetector(
      //             onTap: () {
      //               Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (context) => PlayerController()));
      //             },
      //             child: Container(
      //               height: 200,
      //               width: 120,
      //               color: Colors.amber,
      //               child: Image.network(
      //                 'https://firebasestorage.googleapis.com/v0/b/curd-99500.appspot.com/o/photo_5766143064493109616_w%202.jpg?alt=media&token=4030e108-1757-440f-a8cf-93920feaf3f2',
      //                 fit: BoxFit.cover,
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(5.0),
      //         child: GestureDetector(
      //           onTap: () {
      //             Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                     builder: (context) => PlayerController()));
      //           },
      //           child: Container(
      //             height: 200,
      //             width: 120,
      //             color: Colors.amber,
      //             child: Image.network(
      //               'https://firebasestorage.googleapis.com/v0/b/curd-99500.appspot.com/o/photo_5766143064493109616_w%202.jpg?alt=media&token=4030e108-1757-440f-a8cf-93920feaf3f2',
      //               fit: BoxFit.cover,
      //             ),
      //           ),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(7.0),
      //         child: GestureDetector(
      //           onTap: () {
      //             Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                     builder: (context) => PlayerController()));
      //           },
      //           child: Container(
      //             height: 200,
      //             width: 120,
      //             color: Colors.amber,
      //             child: Image.network(
      //               'https://firebasestorage.googleapis.com/v0/b/curd-99500.appspot.com/o/photo_5766143064493109616_w%202.jpg?alt=media&token=4030e108-1757-440f-a8cf-93920feaf3f2',
      //               fit: BoxFit.cover,
      //             ),
      //           ),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(7.0),
      //         child: GestureDetector(
      //           onTap: () {
      //             Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                     builder: (context) => PlayerController()));
      //           },
      //           child: Container(
      //             height: 200,
      //             width: 120,
      //             color: Colors.amber,
      //             child: Image.network(
      //               'https://firebasestorage.googleapis.com/v0/b/curd-99500.appspot.com/o/photo_5766143064493109616_w%202.jpg?alt=media&token=4030e108-1757-440f-a8cf-93920feaf3f2',
      //               fit: BoxFit.cover,
      //             ),
      //           ),
      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
