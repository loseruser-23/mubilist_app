import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_apps/halaman_utama.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _controller.addStatusListener((status){
      if (status == AnimationStatus.completed){
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HalUt(),
          ),
        );
      }
    }
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset('assets/animations/opening_animation.json',
        controller: _controller,
        onLoaded: (composition){
          _controller.duration = composition.duration;
          _controller.forward();
        },
        width:300,
        height: 300,
        fit: BoxFit.contain,
        ),
      )
    );
  }
}
