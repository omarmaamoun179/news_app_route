import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_route/core/app_theme/app_theme.dart';

class DarwerWidget extends StatelessWidget {
  const DarwerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var b = MediaQuery.of(context).size.width;
    var theme = AppTheme.appTheme(MediaQuery.of(context));

    return Column(
      children: [
        Container(
          color: theme.primaryColor,
          width: b * 0.6,
          height: h * 0.2,
          child: Text(
            'News',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          width: b * 0.6,
          height: h * 0.8,
          color: Colors.white,
          child: const Column(
            children: [],
          ),
        ),
      ],
    );
  }
}