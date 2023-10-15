import 'package:flutter/material.dart';
import 'package:news_app_route/models/articles_modle/article.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final Article? articles;
  const WebViewScreen({
    super.key,
    this.articles,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(articles!.source!.name!.toUpperCase() ?? ''),
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: articles!.url,
      ),
    );
  }
}
