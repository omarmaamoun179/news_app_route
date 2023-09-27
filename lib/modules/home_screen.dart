import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_route/core/network/api_manager.dart';
import 'package:news_app_route/models/categories_mode.dart';
import 'package:news_app_route/shared/widgets/grid_view_item.dart';
import 'package:news_app_route/shared/widgets/darwer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CatergorieModel> categories = [
    CatergorieModel(
      name: 'Sports',
      image: 'assets/images/sports.png',
      id: 'sports',
      color: const Color(0xffC91C22),
    ),
    CatergorieModel(
      name: 'Politces',
      image: 'assets/images/politics.png',
      id: 'sports',
      color: const Color(0xff003E90),
    ),
    CatergorieModel(
      name: 'Health',
      image: 'assets/images/health.png',
      id: 'sports',
      color: const Color(0xffED1E79),
    ),
    CatergorieModel(
      name: 'Bussiens',
      image: 'assets/images/bussines.png',
      id: 'sports',
      color: const Color(0xffCF7E48),
    ),
    CatergorieModel(
      name: 'Enviroment',
      image: 'assets/images/environment.png',
      id: 'sports',
      color: const Color(0xff4882CF),
    ),
    CatergorieModel(
      name: 'Science',
      image: 'assets/images/science.png',
      id: 'sports',
      color: const Color(0xffF2D352),
    ),
  ];
  int index = 0;
  @override
  void initState() {
    ApiManger.getSources(categories[index].name);
    super.initState();
  }

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
            selectedCatergorie == null ? 'News App' : selectedCatergorie!.name,
            style: GoogleFonts.exo(fontSize: 22, fontWeight: FontWeight.w600),
          ),
        ),
        drawer: DarwerWidget(
          makeModelNull: makeModelNull,
        ),
        body: selectedCatergorie == null
            ? Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pick your Category',
                      style: GoogleFonts.poppins(
                          fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: .79,
                                crossAxisSpacing: 18,
                                mainAxisSpacing: 18),
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return GridViewItemWidget(
                              OnClick: onClick,
                              index: index,
                              catergorieModel: categories[index]);
                        },
                      ),
                    ),
                  ],
                ),
              )
            : Center(
                child: Text(
                  selectedCatergorie!.name,
                  style: GoogleFonts.poppins(
                      fontSize: 25, fontWeight: FontWeight.w500),
                ),
              ),
      ),
    );
  }

  makeModelNull() {
    selectedCatergorie = null;
    Navigator.pop(context);
    setState(() {});
  }

  CatergorieModel? selectedCatergorie;

  onClick(
    CatergorieModel catergorieModel,
  ) {
    selectedCatergorie = catergorieModel;
    setState(() {});
    print(catergorieModel.name);
  }
}
