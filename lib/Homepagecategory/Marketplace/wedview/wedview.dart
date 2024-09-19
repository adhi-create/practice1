import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Wedview extends StatefulWidget {
  const Wedview({super.key});

  @override
  State<Wedview> createState() => _WedviewState();
}

class _WedviewState extends State<Wedview> {
  late WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
          Uri.parse('https://www.youtube.com/@AshwiniJewellery/shorts'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ASWINI JEWELLERYS',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
