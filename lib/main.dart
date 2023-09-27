import 'package:flutter/material.dart';
import 'package:news_app_route/core/app_theme/app_theme.dart';
import 'package:news_app_route/modules/home_screen.dart';
import 'package:news_app_route/modules/splash_screen.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appTheme(MediaQuery.of(context)),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
    );
  }
}
