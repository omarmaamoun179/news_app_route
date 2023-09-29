import 'package:flutter/material.dart';
import 'package:news_app_route/core/network/api_manager.dart';
import 'package:news_app_route/models/categories_mode.dart';
import 'package:news_app_route/models/source_model.dart';
import 'package:news_app_route/modules/default_tab_bar.dart';

class NewsScreen extends StatefulWidget {
  CatergorieModel? catergorieModel;
  NewsScreen({super.key, this.catergorieModel});
  static const String routeName = 'news_screen';

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<Sources> sources = [];

  int? currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManger.getSources(widget.catergorieModel?.id ?? 'sports'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text('Error'));
        }
        try {
          sources = snapshot.data?.sources ?? [];
        } on Exception catch (e) {
          print(e.toString());

          return const Center(child: Text('Error'));
        }
        return TabBarViewWidget(
          sources: sources,
        );
      },
    );
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
