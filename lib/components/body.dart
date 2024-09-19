import 'package:flutter/material.dart';

import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: (20)),
            const HomeHeader(),
            const SizedBox(height: (10)),
            const DiscountBanner(),
            Categories(),
            const SpecialOffers(),
            const SizedBox(height: (30)),
            PopularProducts(),
            const SizedBox(height: (30)),
          ],
        ),
      ),
    );
  }
}
