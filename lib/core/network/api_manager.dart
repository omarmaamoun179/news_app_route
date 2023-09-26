import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_route/constant/constant.dart';

class ApiManger {
  Future<http.Response> getSources() async {
    Uri url = Uri.https(Constant.baseUrl, Constant.sources, {
      'apiKey': Constant.apiKey,
    });
    var response = await http.get(url);
    jsonDecode(response.body);
    print(response.body);
    return response;
  }
}
