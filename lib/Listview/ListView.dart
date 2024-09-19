import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:providerpractice/ProductsListPage/pageview.dart';

class LivewHomePage extends StatefulWidget {
  final int currentIndex;
  final List<dynamic> items;
  const LivewHomePage({
    super.key,
    required this.currentIndex,
    required this.items,
  });

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<LivewHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LivewHomePage> {
  List<String> ImagItem = [
    'https://firebasestorage.googleapis.com/v0/b/reelsvideo-f90b6.appspot.com/o/4.webp?alt=media&token=350429d2-9ff2-40c1-8149-d15853b6ed5f&_gl=1*dy8pvo*_ga*OTQxNDExNTk3LjE2OTU4NzUyODk.*_ga_CW55HF8NVT*MTY5NTg3NTI4OS4xLjEuMTY5NTg3NjEyNC4zNy4wLjA.',
    'https://firebasestorage.googleapis.com/v0/b/reelsvideo-f90b6.appspot.com/o/4.webp?alt=media&token=350429d2-9ff2-40c1-8149-d15853b6ed5f&_gl=1*dy8pvo*_ga*OTQxNDExNTk3LjE2OTU4NzUyODk.*_ga_CW55HF8NVT*MTY5NTg3NTI4OS4xLjEuMTY5NTg3NjEyNC4zNy4wLjA.',
    'https://firebasestorage.googleapis.com/v0/b/curd-99500.appspot.com/o/Red%20and%20Gold%20Traditional%20Indian%20Bridal%20Makeup%20Tutorial%20YouTube%20Thumbnail.png?alt=media&token=316ff894-9ac1-4efd-87d2-2d6d90acc9df&_gl=1*1qwh7e0*_ga*MTk4NTIzMzE1Ni4xNjkyNDY0NzIx*_ga_CW55HF8NVT*MTY5NjIyMzg2MC4zOS4xLjE2OTYyMjM5NTIuNjAuMC4w',
    'https://firebasestorage.googleapis.com/v0/b/reelsvideo-f90b6.appspot.com/o/4.webp?alt=media&token=350429d2-9ff2-40c1-8149-d15853b6ed5f&_gl=1*dy8pvo*_ga*OTQxNDExNTk3LjE2OTU4NzUyODk.*_ga_CW55HF8NVT*MTY5NTg3NTI4OS4xLjEuMTY5NTg3NjEyNC4zNy4wLjA.',
    'https://firebasestorage.googleapis.com/v0/b/reelsvideo-f90b6.appspot.com/o/4.webp?alt=media&token=350429d2-9ff2-40c1-8149-d15853b6ed5f&_gl=1*dy8pvo*_ga*OTQxNDExNTk3LjE2OTU4NzUyODk.*_ga_CW55HF8NVT*MTY5NTg3NTI4OS4xLjEuMTY5NTg3NjEyNC4zNy4wLjA.',
    'https://firebasestorage.googleapis.com/v0/b/curd-99500.appspot.com/o/Red%20and%20Gold%20Traditional%20Indian%20Bridal%20Makeup%20Tutorial%20YouTube%20Thumbnail.png?alt=media&token=316ff894-9ac1-4efd-87d2-2d6d90acc9df&_gl=1*1qwh7e0*_ga*MTk4NTIzMzE1Ni4xNjkyNDY0NzIx*_ga_CW55HF8NVT*MTY5NjIyMzg2MC4zOS4xLjE2OTYyMjM5NTIuNjAuMC4w',
    'https://firebasestorage.googleapis.com/v0/b/reelsvideo-f90b6.appspot.com/o/4.webp?alt=media&token=350429d2-9ff2-40c1-8149-d15853b6ed5f&_gl=1*dy8pvo*_ga*OTQxNDExNTk3LjE2OTU4NzUyODk.*_ga_CW55HF8NVT*MTY5NTg3NTI4OS4xLjEuMTY5NTg3NjEyNC4zNy4wLjA.',
  ];
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: const Text('hi'),
      ),
      body: MasonryGridView.builder(
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: widget.items.length,
          itemBuilder: (context, index) {
            final currentItem = widget.items[index];
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ItemDetailsPage(
                              currentIndex: index, items: widget.items)));
                },
                child: Image.network(currentItem['productImage']));
          }),
    );
  }
}
