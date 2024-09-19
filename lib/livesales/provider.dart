import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'product.dart';

class ProductProviderlive with ChangeNotifier {
  List<Productlive> _products = [];

  List<Productlive> get products => _products;

  Future<void> fetchProducts() async {
    final url = 'https://retoolapi.dev/nmEnot/data';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _products = data.map((json) => Productlive.fromJson(json)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      throw error;
    }
  }
}
