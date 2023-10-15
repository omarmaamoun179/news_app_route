import 'package:flutter/material.dart';

class AppTheme {
  var mediaQuery = const MediaQueryData();

  static ThemeData appTheme(MediaQueryData mediaQuery) {
    return ThemeData(
        primaryColor: const Color(0xff39A552),
        appBarTheme: AppBarTheme(
          toolbarHeight: mediaQuery.size.height * 0.09,
          centerTitle: true,
          backgroundColor: const Color(0xff39A552),
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
        ));
  }
}
