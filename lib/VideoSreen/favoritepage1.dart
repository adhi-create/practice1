import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:providerpractice/Homepagecategory/Provider/providerProduct.dart';
import 'package:providerpractice/Homepagecategory/Marketplace/marketplaceopeningpage.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  Future<void> _refresh(BuildContext context) async {
    // Fetch data logic using Provider
    await Provider.of<ProviderProductsfav>(context, listen: false)
        .fetchDatafav();
  }

  @override
  void initState() {
    super.initState();
    // Initial data fetch
    _refresh(context);
  }

  Future<void> deleteItem(BuildContext context, String itemId) async {
    try {
      final response = await http.delete(
        Uri.parse('https://retoolapi.dev/pDrQ2s/data/$itemId'),
      );

      if (response.statusCode == 200) {
        // Handle successful deletion (e.g., show a snackbar)
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Item deleted successfully'),
            duration: Duration(seconds: 2),
          ),
        );
        // Refresh the UI after deletion
        _refresh(context);
      } else {
        // Handle API error (e.g., show a snackbar)
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to delete item. Please try again.'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      // Handle general error (e.g., network error)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<ProviderProductsfav>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorites',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => _refresh(context),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 350,
            crossAxisCount: 2,
          ),
          itemCount: dataProvider.datafav.length,
          itemBuilder: (context, int index) {
            final reverseIndex = dataProvider.datafav.length - 1 - index;
            final favoriteItem = dataProvider.datafav[reverseIndex];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailsPage(itemDetails: favoriteItem),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          favoriteItem['Image'] ?? '',
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '₹${favoriteItem['price'] ?? '.'}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 19.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          favoriteItem['title'] ?? '',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              deleteItem(
                                  context, favoriteItem['id'].toString());
                            },
                            icon: const Icon(Icons.favorite),
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
