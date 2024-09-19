import 'package:flutter/material.dart';
import 'package:providerpractice/ProductsListPage/player.dart';
import 'package:providerpractice/reelPage/player.dart';

class ItemDetailsPage extends StatefulWidget {
  final int currentIndex;
  final List<dynamic> items;

  const ItemDetailsPage({
    super.key,
    required this.currentIndex,
    required this.items,
  });

  @override
  State<ItemDetailsPage> createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
      // body: PageView.builder(
      //   scrollDirection: Axis.vertical,
      //   itemCount: widget.items.length,
      //   reverse: true,
      //   controller: PageController(initialPage: widget.currentIndex),
      //   itemBuilder: (context, index) {
      //     final currentItem = widget.items[index];
      //     final videoUrls = currentItem['video'];
      //     final ImageUrl = currentItem['Image2'];
      //     final VideourlProductUrl = currentItem['productUrl'];

      //     return FeedItem(
      //       videoUrl: videoUrls,
      //       // imageUrl: ImageUrl,
      //       // productUrl: VideourlProductUrl,
      //     );
      //   },
      // ),
    );
  }
}
