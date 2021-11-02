import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../widgets/app_bar_widget.dart';

class WebViewScreen extends StatefulWidget {
  final String blogUrl;
  WebViewScreen({required this.blogUrl});

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Container(
        child: WebView(
          initialUrl: widget.blogUrl,
          onWebViewCreated: ((WebViewController webViewController) {
            _completer.complete(webViewController);
          }),
        ),
      ),
    );
  }
}
