import 'package:flutter/material.dart';
import 'package:new_flutter_project/utility/CustomColour.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewApp extends StatefulWidget
{
  const WebViewApp({super.key});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://flutter.dev'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColour.appTheme,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Flutter WebView',style: TextStyle(color: Colors.white),),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}