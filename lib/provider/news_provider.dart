import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_route/constant/constant.dart';
import 'package:news_app_route/core/cashe_helper.dart';
import 'package:news_app_route/models/articles_modle/article.dart';
import 'package:news_app_route/models/articles_modle/articles_modle.dart';
import 'package:news_app_route/models/categories_mode.dart';
import 'package:news_app_route/models/source_model.dart';

class NewsProvider extends ChangeNotifier {
  List<Sources> sources = [];
  List<Article> articlesList = [];
  CatergorieModel? categoryModel;
  CatergorieModel? selectedCategory;
  bool isSearch = true;
  var searchController = TextEditingController();
  int index = 0;
  int indexList = 0;

  void changeIndex(int value) {

    index = value;
    notifyListeners();
  }

  Future<void> getSources(String category) async {
    try {
      var query = {'apiKey': Constant.apiKey, 'category': category};
      Uri url = Uri.https(Constant.baseUrl, Constant.topHeadlines, query);
      final response = await http.get(url);

      var result = jsonDecode(response.body);

      if (response.statusCode == 200 && result['status'] == 'ok') {
        sources = SourceModel.fromJson(result).sources ?? [];
        notifyListeners();
      } else {
        throw Exception('Failed to load source');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getNewsData() async {
    try {
      var query = {
        'apiKey': Constant.apiKey,
        'sources': sources[index].id ?? '',
      };

      Uri url = Uri.https(Constant.baseUrl, Constant.everything, query);

      var response = await http.get(url);
      var result = jsonDecode(response.body);
      if (response.statusCode == 200 && result['status'] == 'ok') {
        articlesList = ArticlesModle.fromJson(result).articles ?? [];
        notifyListeners();
      } else {
        throw Exception('Failed to load source');
      }
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getSearchData(String q) async {
    try {
      var query = {'apiKey': Constant.apiKey, 'q': q};

      Uri url = Uri.https(Constant.baseUrl, Constant.everything, query);

      var response = await http.get(url);
      var result = jsonDecode(response.body);
      if (response.statusCode == 200 && result['status'] == 'ok') {
        articlesList = ArticlesModle.fromJson(result).articles ?? [];
        notifyListeners();
      } else {
        throw Exception('Failed to load source');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void makeModelNull(context) {
    selectedCategory = null;
    Navigator.pop(context);
    notifyListeners();
  }

  void onClick(CatergorieModel categoryModel) {
    selectedCategory = categoryModel;
    notifyListeners();
    print(selectedCategory!.id);
  }

  void changeSearchIcon() {
    isSearch = !isSearch;
    notifyListeners();
  }

  void makeCacheNull(context) {
    CasheHelper.pref.clear();
    notifyListeners();
  }

  void onSave(bool isSaved) {
    CasheHelper.saveData('news', isSaved);
    notifyListeners();
  }
}
