import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProviderProducts extends ChangeNotifier {
  final String apiUrl = 'https://retoolapi.dev/p6db2K/data';
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

class ProviderProducts2 extends ChangeNotifier {
  final String apiUrl = 'https://retoolapi.dev/jvSTQS/data';
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

class ProviderProducts3 extends ChangeNotifier {
  final String apiUrl = 'https://retoolapi.dev/8Ox6xj/data';
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

class ProviderProducts4 extends ChangeNotifier {
  final String apiUrl = 'https://retoolapi.dev/RhuCUF/data';
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

class ProviderProductscate5 extends ChangeNotifier {
  final String apiUrl = 'https://retoolapi.dev/RhuCUF/data';
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

class ProviderProducts6 extends ChangeNotifier {
  final String apiUrl = 'https://retoolapi.dev/YU5QXP/data';
  List<dynamic> data6 = [];

  Future<void> fetchData6() async {
    try {
      final response = await http.get(Uri.parse(apiUrl),
          headers: {HttpHeaders.contentTypeHeader: 'application/json'});

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);

        data6 = jsonData;
        notifyListeners();
      } else {
        throw Exception('Failed to load data from API');
      }
    } catch (e) {}
  }
}

class ProviderProducts7 extends ChangeNotifier {
  final String apiUrl = 'https://retoolapi.dev/2xk7Ta/data';
  List<dynamic> data7 = [];

  Future<void> fetchData7() async {
    try {
      final response = await http.get(Uri.parse(apiUrl),
          headers: {HttpHeaders.contentTypeHeader: 'application/json'});

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);

        data7 = jsonData;
        notifyListeners();
      } else {
        throw Exception('Failed to load data from API');
      }
    } catch (e) {}
  }
}

class ProviderProducts8 extends ChangeNotifier {
  final String apiUrl = 'https://retoolapi.dev/M6w3O8/data';
  List<dynamic> data8 = [];

  Future<void> fetchData8() async {
    try {
      final response = await http.get(Uri.parse(apiUrl),
          headers: {HttpHeaders.contentTypeHeader: 'application/json'});

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);

        data8 = jsonData;
        notifyListeners();
      } else {
        throw Exception('Failed to load data from API');
      }
    } catch (e) {}
  }
}

class ProviderProducts9 extends ChangeNotifier {
  final String apiUrl = 'https://retoolapi.dev/EbQR20/data';
  List<dynamic> data9 = [];

  Future<void> fetchData9() async {
    try {
      final response = await http.get(Uri.parse(apiUrl),
          headers: {HttpHeaders.contentTypeHeader: 'application/json'});

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);

        data9 = jsonData;
        notifyListeners();
      } else {
        throw Exception('Failed to load data from API');
      }
    } catch (e) {}
  }
}

class ProviderProductsfav extends ChangeNotifier {
  final String apiUrl =
      'https://retoolapi.dev/pDrQ2s/data'; // Replace with your API endpoint
  List<dynamic> datafav = [];

  Future<void> fetchDatafav() async {
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        List<dynamic> filteredData = jsonData
            .where((item) =>
                item['user_id'] == FirebaseAuth.instance.currentUser?.email)
            .toList();

        datafav = filteredData; // Update data10 with filtered data
        notifyListeners(); // Notify listeners (widgets listening to this ChangeNotifier)
      } else {
        throw Exception('Failed to load data from API');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> refreshData() async {
    await fetchDatafav();
  }
}
