import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_route/cubit/search_state.dart';
import 'package:news_app_route/models/articles_modle/article.dart';
import 'package:news_app_route/models/articles_modle/articles_modle.dart';

import '../../constant/constant.dart';



class SearchCubit extends Cubit<SearchState> {
  List<Article> articlesList = [];
  bool isSearch = false;
  var searchController = TextEditingController();
  SearchCubit() : super(SearchInitial());
  static SearchCubit get  (context) => BlocProvider.of(context);
  Future<void> seachNews(String query) async {
    try {
      emit(SearchLoading());
      var q = {
        'apiKey': Constant.apiKey,
        'q': query,
      };
      Uri url = Uri.https(Constant.baseUrl, Constant.everything, q);
      var response = await http.get(url);
      var result = jsonDecode(response.body);
      articlesList = ArticlesModle.fromJson(result).articles ?? [];
      emit(SearchSuccess());
    } on Exception catch (e) {
      emit(SearchError(e.toString()));
    }
  }
  cahngeAppBar(){
    isSearch = !isSearch;
    emit(SearchChangeAppBarState());
  }
}
