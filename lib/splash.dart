import 'package:app/splash_2.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  // ignore: use_super_parameters
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _backgroundOpacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _backgroundOpacityAnimation = Tween<double>(
      begin: 0.0,
      end: 0.5,
    ).animate(_controller);
    _controller.forward();
    _navigateToHome();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 5));
    if (mounted) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => Splash2(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Fade transition
            return FadeTransition(opacity: animation, child: child);

            // Slide from right
            // ignore: dead_code
            const begin = Offset(1.0, 0.0); // Change to 1.0, 0.0
            const end = Offset.zero;
            var tween = Tween(begin: begin, end: end);
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 800),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image with animation
          AnimatedBuilder(
            animation: _backgroundOpacityAnimation,
            builder: (context, child) {
              return Opacity(
                opacity: _backgroundOpacityAnimation.value,
                child: Image.asset(
                  'assets/hm-slider-3-mobile.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              );
            },
          ),
          // Logo centered on top
          Center(
            child: Image.asset(
              'assets/pipfa_logo 13 26 75.png',
              width: 150,
              height: 150,
            ),
          ),
        ],
      ),
    );
  }
}
