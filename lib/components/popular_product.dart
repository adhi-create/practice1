import 'package:flutter/material.dart';

import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: (20)),
          child: SectionTitle(title: "Popular Products", press: () {}),
        ),
        const SizedBox(height: (20)),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              // children: [
              //   ...List.generate(
              //     demoProducts.length,
              //     (index) {
              //       if ([index])
              //         return ProductCard(product: demoProducts[index]);

              //       return SizedBox
              //           .shrink(); // here by default width and height is 0
              //     },
              //   ),
              //   SizedBox(width: (20)),
              // ],
              ),
        )
      ],
    );
  }
}
