import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_route/core/app_theme/app_theme.dart';
import 'package:news_app_route/core/cashe_helper.dart';
import 'package:news_app_route/cubit/new_cubit.dart';
import 'package:news_app_route/cubit/search_cubit.dart';
import 'package:news_app_route/modules/home_screen.dart';
import 'package:news_app_route/modules/news_screen.dart';
import 'package:news_app_route/modules/search_screen.dart';
import 'package:news_app_route/modules/splash_screen.dart';
import 'package:news_app_route/my_bloc_observ.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CasheHelper.init();
  String? cashe = CasheHelper.getData('news');
  String start;
  if (cashe == null) {
    start = SplashScreen.routeName;
  } else {
    start = HomeScreen.routeName;
  }
  runApp(
    NewsApp(
      startWidget: start,
    ),
  );
  Bloc.observer = MyBlocObserver();
}

class NewsApp extends StatelessWidget {
  String startWidget;
  NewsApp({Key? key, required this.startWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchCubit>(
          create: (context) => SearchCubit(),
        ),
        BlocProvider(create: (context) => NewsCubit()),
      ],
      child: MaterialApp(
        theme: AppTheme.appTheme(MediaQuery.of(context)),
        debugShowCheckedModeBanner: false,
        initialRoute: startWidget,
        routes: {
          SplashScreen.routeName: (context) => const SplashScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          NewsScreen.routeName: (context) => const NewsScreen(),
          SearchScreen.routeName: (context) => SearchScreen(),
        },
      ),
    );
  }
}
