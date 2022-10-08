import 'dart:async';

import 'package:book_store/presentation/screen/main_screen.dart';
import 'package:flutter/material.dart';

class SpashScreen extends StatefulWidget {
  const SpashScreen({Key? key}) : super(key: key);

  @override
  State<SpashScreen> createState() => _SpashScreenState();
}

class _SpashScreenState extends State<SpashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _animation = CurvedAnimation(
        parent: _animationController,
        curve: Curves.bounceOut,
        reverseCurve: Curves.bounceInOut);
    _animationController.forward();
    Timer(
      const Duration(milliseconds: 4000),
      () => Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(
            builder: (context) => const MainScreen(),
          ), (route) => false),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //     const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(255, 111, 88, 1),
        child: Center(
          child: ScaleTransition(
            scale: _animation,
            child: Image.asset("assets/book-38.gif"),
          ),
        ),
      ),
    );
  }
}
