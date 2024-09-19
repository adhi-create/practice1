import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class VideoProviderProducts extends ChangeNotifier {
  final String apiUrl = 'https://retoolapi.dev/UpMRXy/data';
  List<dynamic> data = [];

  Future<void> fetchData1() async {
    try {
      final response = await http.get(Uri.parse(apiUrl),
          headers: {HttpHeaders.contentTypeHeader: 'application/json'});

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        data = jsonData;
        notifyListeners();
      } else {
        throw Exception('Failed to load data from API');
      }
    } catch (e) {}
  }
}

class VideoProviderProducts2 extends ChangeNotifier {
  final String apiUrl = 'https://retoolapi.dev/mgcrCQ/data';
  List<dynamic> data2 = [];

  Future<void> fetchData2() async {
    try {
      final response = await http.get(Uri.parse(apiUrl),
          headers: {HttpHeaders.contentTypeHeader: 'application/json'});

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        data2 = jsonData;
        notifyListeners();
      } else {
        throw Exception('Failed to load data from API');
      }
    } catch (e) {}
  }
}

class VideoProviderProducts3 extends ChangeNotifier {
  final String apiUrl = 'https://retoolapi.dev/mgcrCQ/data';
  List<dynamic> data3 = [];

  Future<void> fetchData3() async {
    try {
      final response = await http.get(Uri.parse(apiUrl),
          headers: {HttpHeaders.contentTypeHeader: 'application/json'});

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        data3 = jsonData;
        notifyListeners();
      } else {
        throw Exception('Failed to load data from API');
      }
    } catch (e) {}
  }
}

class videoProviderProducts4 extends ChangeNotifier {
  final String apiUrl = 'https://retoolapi.dev/mgcrCQ/data';
  List<dynamic> data4 = [];

  Future<void> fetchData4() async {
    try {
      final response = await http.get(Uri.parse(apiUrl),
          headers: {HttpHeaders.contentTypeHeader: 'application/json'});

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        data4 = jsonData;
        notifyListeners();
      } else {
        throw Exception('Failed to load data from API');
      }
    } catch (e) {}
  }
}

class VideoProviderProductscate5 extends ChangeNotifier {
  final String apiUrl = 'https://retoolapi.dev/pDrQ2s/data';
  List<dynamic> data5 = [];

  Future<void> fetchData5() async {
    try {
      final response = await http.get(Uri.parse(apiUrl),
          headers: {HttpHeaders.contentTypeHeader: 'application/json'});

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        data5 = jsonData;
        notifyListeners();
      } else {
        throw Exception('Failed to load data from API');
      }
    } catch (e) {}
  }
}

class Favoriteprovider extends ChangeNotifier {
  List<dynamic> _words = [];
  List<dynamic> get words => _words;

  void togglefavorite(dynamic words) {
    final isExist = _words.contains(words);
    if (isExist) {
      _words.remove(words);
    } else {
      _words.add(words);
    }
    notifyListeners();
  }

  static of(BuildContext context, {bool listen = true}) {
    return Provider.of<Favoriteprovider>(context, listen: listen);
  }

  bool isExist(words) {
    final isExist = _words.contains(words);
    return isExist;
  }

  void cleatFavorite() {
    _words = [];
    notifyListeners();
  }
}

class ProviderProductsflim extends ChangeNotifier {
  final String apiUrl = 'https://retoolapi.dev/mgcrCQ/data';
  List<dynamic> dataflim = [];

  Future<void> fetchDataflim() async {
    try {
      final response = await http.get(Uri.parse(apiUrl),
          headers: {HttpHeaders.contentTypeHeader: 'application/json'});

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);

        dataflim = jsonData;
        notifyListeners();
      } else {
        throw Exception('Failed to load data from API');
      }
    } catch (e) {}
  }
}

class ProviderProductsflimlist extends ChangeNotifier {
  final String apiUrl = 'https://retoolapi.dev/mgcrCQ/data';
  List<dynamic> dataflimlist = [];

  Future<void> fetchDataflimlist() async {
    try {
      final response = await http.get(Uri.parse(apiUrl),
          headers: {HttpHeaders.contentTypeHeader: 'application/json'});

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);

        dataflimlist = jsonData;
        notifyListeners();
      } else {
        throw Exception('Failed to load data from API');
      }
    } catch (e) {}
  }
}
