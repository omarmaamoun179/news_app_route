import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_route/constant/constant.dart';
import 'package:news_app_route/models/source_model.dart';

class ApiManger {
  static Future<http.Response> getSources(String category) async {
    var query = {
      'apiKey': Constant.apiKey,
      'category': category,
    };
    Uri url = Uri.https(Constant.baseUrl, Constant.sources, query);
    var response = await http.get(url);
    SourceModel.fromJson(jsonDecode(response.body));
    print(response.body);
    return response;
  }
}
