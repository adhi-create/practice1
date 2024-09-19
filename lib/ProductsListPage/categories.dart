import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      'https://firebasestorage.googleapis.com/v0/b/curd-99500.appspot.com/o/Shutterstock-nVCJRHpNsZ.jpg?alt=media&token=e42fdf50-df32-4a28-9cce-bb5af1039f83',
      'https://firebasestorage.googleapis.com/v0/b/curd-99500.appspot.com/o/Shutterstock-2CUFLmSiBe.jpg?alt=media&token=06fcaea6-10c0-401f-9fb0-3e852684f8a7',
      'https://firebasestorage.googleapis.com/v0/b/curd-99500.appspot.com/o/Shutterstock-6dgw2KyoAf.jpg?alt=media&token=72f17c00-7541-436c-9466-4fa9b9aed587',
      'https://firebasestorage.googleapis.com/v0/b/curd-99500.appspot.com/o/Shutterstock-63wMcFioRa.jpg?alt=media&token=f8059635-78da-42fe-bb56-dc7396aad466',
      'https://freesvg.org/img/1695024562cupcake-with-cherry-on-top.png',
      'https://freesvg.org/img/1695024562cupcake-with-cherry-on-top.png'
    ];
    List<String> categoriesText = [
      'Tshirt',
      'Shirt',
      'Dress',
      'TopWear',
      'Bags',
      'jewellery'
    ];
    List<String> categoriText = [
      '/myhome',
      'Shirt',
      'Dress',
      'TopWear',
      'Bags',
      'jewellery'
    ];

    return Padding(
      padding: const EdgeInsets.all(20.0), // Use 20.0 instead of (20)
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            imageUrl: categories[index],
            Text2: categoriesText[index],
            press: () {},
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String imageUrl;
  final GestureTapCallback press;
  final String Text2;

  const CategoryCard({
    super.key,
    required this.imageUrl,
    required this.press,
    required this.Text2,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: 55.0, // Use 55.0 instead of (55)
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15.0), // Use 15.0 instead of (15)
              height: 55.0, // Use 55.0 instead of (55)
              width: 55.0, // Use 55.0 instead of (55)
              decoration: BoxDecoration(
                color: const Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 5.0), // Use 5.0 instead of 5
            Text(Text2, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
