import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Youtube_View extends StatefulWidget {
  String url, pageName;

  Youtube_View({this.url, this.pageName});

  @override
  _Youtube_ViewState createState() => _Youtube_ViewState();
}

class _Youtube_ViewState extends State<Youtube_View> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: WebView(
        initialUrl: widget.url,
      ),
    );
  }
}
