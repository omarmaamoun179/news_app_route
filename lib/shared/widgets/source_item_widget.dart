import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SourceItemWidget extends StatelessWidget {
  SourceItemWidget({
    super.key,
    required this.isSelected,
    required this.txt,
  });
  String txt;
  bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 40, top: 20, left: 15),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green : Colors.white,
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        txt,
        style: GoogleFonts.exo(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: isSelected ? Colors.white : Colors.green,
        ),
      ),
    );
  }
}
