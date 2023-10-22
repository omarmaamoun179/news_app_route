import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_route/cubit/news_state.dart';
import 'package:news_app_route/cubit/search_cubit.dart';
import 'package:news_app_route/cubit/search_state.dart';
import 'package:news_app_route/models/articles_modle/article.dart';
import 'package:news_app_route/shared/widgets/article_news_screen.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key, this.isSearch});
  static const String routeName = 'search_screen';
  bool? isSearch = false;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          width: mediaQuery.width * 1,
          height: mediaQuery.height * 0.05,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Center(
            child: TextField(
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.bottom,
              controller: SearchCubit.get(context).searchController,
              onChanged: (value) {
                SearchCubit.get(context).seachNews(value);
              },
              onSubmitted: (value) {
                SearchCubit.get(context).seachNews(value);
              },
              decoration: const InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {
          if (state is HomeNewsSuccessState) {
            SearchCubit.get(context)
                .seachNews(SearchCubit.get(context).searchController.text);
          }
        },
        builder: (context, state) {
          var list = SearchCubit.get(context).articlesList;
          if (state is SearchLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: TextField(
              //     controller: SearchCubit.get(context).searchController,
              //     onChanged: (value) {
              //       SearchCubit.get(context).seachNews(value);
              //     },
              //     onSubmitted: (value) {
              //       SearchCubit.get(context).seachNews(value);
              //     },
              //     decoration: const InputDecoration(
              //       labelText: 'Search',
              //       prefixIcon: Icon(Icons.search),
              //       border: OutlineInputBorder(),
              //     ),
              //   ),
              // ),
              Expanded(
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return ArticlesNewsWidget(articles: list[index]);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class SuccessNews extends StatelessWidget {
  SuccessNews(
      {super.key, required this.mediaQuery, required this.list, this.isSearch});

  final Size mediaQuery;
  bool? isSearch = false;
  final List<Article> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          width: mediaQuery.width * 1,
          height: mediaQuery.height * 0.05,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Center(
            child: TextField(
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.bottom,
              controller: SearchCubit.get(context).searchController,
              onChanged: (value) {
                SearchCubit.get(context).seachNews(value);
              },
              onSubmitted: (value) {
                SearchCubit.get(context).seachNews(value);
              },
              decoration: const InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: TextField(
          //     controller: SearchCubit.get(context).searchController,
          //     onChanged: (value) {
          //       SearchCubit.get(context).seachNews(value);
          //     },
          //     onSubmitted: (value) {
          //       SearchCubit.get(context).seachNews(value);
          //     },
          //     decoration: const InputDecoration(
          //       labelText: 'Search',
          //       prefixIcon: Icon(Icons.search),
          //       border: OutlineInputBorder(),
          //     ),
          //   ),
          // ),
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ArticlesNewsWidget(articles: list[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
