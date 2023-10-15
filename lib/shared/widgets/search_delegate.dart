import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_route/core/network/api_manager.dart';
import 'package:news_app_route/cubit/new_cubit.dart';
import 'package:news_app_route/cubit/news_state.dart';
import 'package:news_app_route/shared/widgets/article_news_screen.dart';

class Search extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getSearchData(query),
      child: BlocConsumer<NewsCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeLoadindState) {
            const Center(child: CircularProgressIndicator());
          } else if (state is HomeNewsErrorState) {
            const Center(child: Text('No News'));
          } else {
            const Center(child: Text('No News'));
          }
        },
        builder: (context, state) {
          if (state is HomeLoadindState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeNewsErrorState) {
            return const Center(
                child: Text(
              'No News',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ));
          } else if (state is HomeNewsSuccessState) {
            return const NewsSuccess();
          } else {
            return const Center(
                child: Text(
              'No News',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ));
          }
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return s}
}

/*

 */
class NewsSuccess extends StatelessWidget {
  const NewsSuccess({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/images/pattern.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: ListView.builder(
        itemCount: NewsCubit.get(context).articlesList.length,
        itemBuilder: (context, index) {
          return ArticlesNewsWidget(
            articles: NewsCubit.get(context).articlesList[index],
          );
        },
      ),
    );
  }
}
