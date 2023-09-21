import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String title;
  const CategoryItem({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    var b = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Icon(icon),
        SizedBox(width: b * 0.02),
        Text(title),
      ],
    );
  }
}
