import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_route/core/app_theme/app_theme.dart';
import 'package:news_app_route/cubit/new_cubit.dart';
import 'package:news_app_route/modules/home_screen.dart';
import 'package:news_app_route/modules/news_screen.dart';
import 'package:news_app_route/modules/search_screen.dart';
import 'package:news_app_route/modules/splash_screen.dart';
import 'package:news_app_route/my_bloc_observ.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => NewsCubit(),
    child: const NewsApp(),
  ));
  Bloc.observer = MyBlocObserver();
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appTheme(MediaQuery.of(context)),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        NewsScreen.routeName: (context) => NewsScreen(),
        SearchScreen.routeName: (context) => SearchScreen(),
      },
    );
  }
}
