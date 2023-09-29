import 'package:flutter/material.dart';
import 'package:news_app_route/core/network/api_manager.dart';
import 'package:news_app_route/models/source_model.dart';
import 'package:news_app_route/shared/widgets/source_item_widget.dart';

class TabBarViewWidget extends StatefulWidget {
  TabBarViewWidget({
    super.key,
    required this.sources,
  });

  List<Sources> sources = [];

  Function? tapClicked;
  @override
  State<TabBarViewWidget> createState() => _TabBarViewWidgetState();
}

class _TabBarViewWidgetState extends State<TabBarViewWidget> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
              onTap: (value) {
                currentindex = value;
                setState(() {});
              },
              indicatorColor: Colors.transparent,
              isScrollable: true,
              tabs: widget.sources.map((e) {
                return SourceItemWidget(
                    isSelected: widget.sources.indexOf(e) == currentindex,
                    txt: e.name ?? '');
              }).toList()),
        ),
        FutureBuilder(
          future: ApiManger.getNewsData(widget.sources[currentindex].id ?? ''),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(child: Text('Error'));
            }
            var articles = snapshot.data?.articles ?? [];
            return Expanded(
              child: ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return Text(articles[index].title ?? '');
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
