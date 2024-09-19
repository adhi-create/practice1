import 'package:flutter/material.dart';
import 'package:providerpractice/VideoSreen/getDataApi.dart';
import 'package:providerpractice/VideoSreen/modal.dart';

class VideoProvider extends ChangeNotifier {
  Modalvideo? Post;
  bool loading = false;
  getDataProvider() async {
    loading = true;

    Post = (await GetData())!;
    notifyListeners();
  }
}
