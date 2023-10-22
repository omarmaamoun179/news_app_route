import 'package:news_app_route/core/cashe_helper.dart';

class Constant {
  static const String apiKey = '3d32fc35098b4ae6aa04e5d9949feaf4';
  static const String baseUrl = 'newsapi.org';
  static const String topHeadlines = '/v2/top-headlines/sources';
  static const String everything = '/v2/everything';
  static const String sources = '/v2/sources';

  static String? cashe = CasheHelper.getData('news');
}
