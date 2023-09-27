import 'package:flutter/material.dart';
import 'package:news_app_route/models/source_model.dart';
import 'package:news_app_route/shared/widgets/source_item_widget.dart';

class TabBarViewWidget extends StatefulWidget {
  TabBarViewWidget({
    super.key,
    this.sources,
    this.currentindex,
  });

  List<Sources>? sources = [];
  int? currentindex = 0;
  Function? tapClicked;
  @override
  State<TabBarViewWidget> createState() => _TabBarViewWidgetState();
}

class _TabBarViewWidgetState extends State<TabBarViewWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sources!.length,
        child: TabBar(
          onTap: (value) {
            widget.currentindex = value;
            setState(() {});
          },
          indicatorColor: Colors.transparent,
          isScrollable: true,
          tabs: widget.sources!.map((e) {
            return SourceItemWidget(
                isSelected: widget.sources!.indexOf(e) == widget.currentindex,
                txt: e.name ?? '');
          }).toList(),
        ));
  }
}
