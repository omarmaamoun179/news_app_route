import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String title;
  Function onClicked;
  CategoryItem(
      {super.key,
      required this.icon,
      required this.title,
      required this.onClicked});

  @override
  Widget build(BuildContext context) {
    var b = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        onClicked();
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.fromLTRB(0, 10.0, 0, 0.0),
              decoration: const BoxDecoration(
                color: Color(0xff000000),
                borderRadius: BorderRadius.all(Radius.circular(100.0)),
              ),
              child: Icon(icon, color: const Color(0xffffffff), size: 24.0),
            ),
            SizedBox(width: b * 0.02),
            Text(title,
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
      ),
    );
  }
}
