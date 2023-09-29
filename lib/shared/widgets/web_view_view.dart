import 'package:flutter/material.dart';
import 'package:news_app_route/models/articles_modle/article.dart';
import 'package:news_app_route/models/source_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final Article? articles;
  final Sources? sources;
  const WebViewScreen({super.key, this.articles, this.sources});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(sources!.name!.toLowerCase() ?? ''),
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: articles!.url,
      ),
    );
  }
}
