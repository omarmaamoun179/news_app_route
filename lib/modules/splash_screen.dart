import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splashScreen';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/splash_screen.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}