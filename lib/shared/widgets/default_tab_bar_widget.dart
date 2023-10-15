import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_route/cubit/new_cubit.dart';
import 'package:news_app_route/cubit/news_state.dart';
import 'package:news_app_route/shared/widgets/source_item_widget.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeLoadindState) {
          const Center(child: CircularProgressIndicator());
        } else if (state is HomeSorcesErrorState) {
          const Center(
            child: Text('No News'),
          );
        }
      },
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return DefaultTabController(
          length: cubit.sources.length,
          child: TabBar(
            padding: const EdgeInsets.all(15),
            indicatorColor: Colors.transparent,
            isScrollable: true,
            onTap: (value) {
              cubit.index = value;
              cubit.getNewsData();
            },
            tabs: cubit.sources
                .map(
                  (e) => SourceItemWidget(
                    isSelected: cubit.index == cubit.sources.indexOf(e),
                    txt: e.name ?? '',
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
