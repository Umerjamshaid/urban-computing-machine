import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splash2 extends StatelessWidget {
  const Splash2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Logo Image
          Center(
            child: Lottie.asset(
              'assets/AniPIPFALogo.json',
              width: 250,
              height: 250,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
