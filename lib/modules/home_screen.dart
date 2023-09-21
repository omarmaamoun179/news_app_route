import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_route/models/categories_mode.dart';
import 'package:news_app_route/shared/widgets/darwer_widget.dart';

class HomeScreen extends StatelessWidget {
 HomeScreen({super.key});
  static const String routeName = 'homeScreen';
  List<CatergorieModel> categories = [
    CatergorieModel(name: 'Sports', image: image, id: 'sports'),
  ];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/images/pattern.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'News App',
            style: GoogleFonts.exo(fontSize: 22, fontWeight: FontWeight.w600),
          ),
        ),
        body: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: ), itemBuilder: itemBuilder),
        drawer: const DarwerWidget(),
      ),
    );
  }
}
