import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hotstar/Screens/bottom/bottomsheet.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Homecontent())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color.fromRGBO(1, 18, 52, 1),
            Color.fromRGBO(5, 44, 134, 1),
          ])),
      child: Center(
        child: Image.asset('assets/image/hot.png'),
      ),
    );
  }
}
