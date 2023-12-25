import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_route/cubit/new_cubit.dart';
import 'package:news_app_route/cubit/news_state.dart';
import 'package:news_app_route/shared/widgets/article_news_screen.dart';
import 'package:news_app_route/shared/widgets/default_tab_bar_widget.dart';

// ignore: must_be_immutable
class NewsScreen extends StatelessWidget {
  static const String routeName = 'news_screen';

  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NewsCubit()..getSources(NewsCubit.get(context).catergorieModel!.id),
      child: BlocConsumer<NewsCubit, HomeState>(listener: (context, state) {
        if (state is HomeLoadindState) {
          const Center(child: CircularProgressIndicator());
        } else if (state is HomeSorcesErrorState) {
          const Center(
            child: Text('No News'),
          );
        } else if (state is HomeSorcesSuccessState) {
          NewsCubit.get(context).getNewsData();
        }
      }, builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Column(
          children: [
            const TabBarWidget(),

            Expanded(
              child: ListView.builder(
                itemCount: cubit.articlesList.length,
                itemBuilder: (context, index) {
                  return ArticlesNewsWidget(
                    articles: NewsCubit.get(context).articlesList[index],
                  );
                },
              ),
            )

            // Expanded(
            //   child: ListView.builder(
            //     itemCount: cubit.articles.length,
            //     itemBuilder: (context, index) {
            //       return ArticlesNewsWidget(
            //         articles: NewsCubit.get(context).articles[index],
            //       );
            //     },
            //   ),
            // )
          ],
        );
      }),
    );
    // return FutureBuilder(
    //   future: ApiManger.getSources(widget.catergorieModel?.id ?? 'sports'),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const Center(child: CircularProgressIndicator());
    //     }
    //     if (snapshot.hasError) {
    //       return const Center(child: Text('Error'));
    //     }
    //     try {
    //       sources = snapshot.data?.sources ?? [];
    //     } on Exception catch (e) {
    //       print(e.toString());

    //       return const Center(child: Text('Error'));
    //     }
    //     return TabBarViewWidget(
    //       sources: sources,
    //     );
    //   },
    // );
  }
}


/*
izedBox(
              height: 100,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 15,
                  );
                },
                padding: const EdgeInsets.all(0),
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.sources!.length ?? 0,
                itemBuilder: (context, index) {
                  var sources = snapshot.data!.sources ?? [];
                  return InkWell(
                    onTap: () {
                      currentindex = index;
                      setState(() {});
                    },
                    child: SourceItemWidget(
                        isSelected:
                            sources.indexOf(sources[index]) == currentindex,
                        txt: sources[index].name ?? ''),
                  );
                },
              ),
            );
          */