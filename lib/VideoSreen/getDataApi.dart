import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:providerpractice/VideoSreen/modal.dart';
import 'package:http/http.dart' as http;

Future<Modalvideo?> GetData() async {
  Modalvideo? result;
  try {
    final Response = await http.get(
        Uri.parse('https://retoolapi.dev/mgcrCQ/data'),
        headers: {HttpHeaders.contentTypeHeader: "application/json"});

    if (Response.statusCode == 200) {
      final item = jsonDecode(Response.body);
      result = Modalvideo.fromJson(item);
    } else {
      print('errror');
    }
  } catch (e) {
    return result;
  }
  return null;
}
