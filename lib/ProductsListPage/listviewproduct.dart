import 'package:flutter/material.dart';
import 'package:providerpractice/ProductsListPage/pageview.dart';

class listproduct extends StatefulWidget {
  final int currentIndex;
  final List<dynamic> items;
  const listproduct({
    super.key,
    required this.currentIndex,
    required this.items,
  });

  @override
  State<listproduct> createState() => _listproductState();
}

class _listproductState extends State<listproduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: widget.items.length,
          itemBuilder: (context, int index) {
            final reverseindex = widget.items.length - 1 - index;
            final currentItem = widget.items[reverseindex];
            //final videoUrls = currentItem['productImage'] ?? '';
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ItemDetailsPage(
                            currentIndex: reverseindex, items: widget.items)));
              },
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Image.network(
                  widget.items[reverseindex]['Image'] ?? '',
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
    );
  }
}
