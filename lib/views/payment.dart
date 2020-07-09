import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class Payment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<Payment> {
  
  @override
  Widget build(BuildContext context) {
    final Completer<WebViewController> _controller = Completer<WebViewController>();  
    return Scaffold(
      appBar: AppBar(title: Text('Make Payment')),
      body: WebView(
        initialUrl: "https:www.youtube.com",
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webviewController){
          _controller.complete(webviewController);
        },
      ),
    );
  }
}
