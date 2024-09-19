import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Wedview1 extends StatefulWidget {
  const Wedview1({super.key});

  @override
  State<Wedview1> createState() => _WedviewState();
}

class _WedviewState extends State<Wedview1> {
  late WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(
          'https://myshopprime.com/adhi/s0968of?fbclid=PAZXh0bgNhZW0CMTEAAabQ0NcLAJLJuxdevlJ_2gW0zaGTwj7TyoZDRPpMcehWFf7RPAZ45Dm4Xdk_aem_AWiiyeRbXbTa-vyQ5oWASrAk2b3yLIo_kWMb_EEcXQ86SC3eGS66E9QpPOA8ptFie_LjRTIknEosBHaUdBzy6sO0'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'BEST FASHION',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
