import 'dart:async';

import 'package:flutter/material.dart';
import 'package:repolens/Screens/home.dart';

class SplashScreenn extends StatefulWidget {
  const SplashScreenn({super.key});
  @override
  _SplashScreennState createState() => _SplashScreennState();
}

class _SplashScreennState extends State<SplashScreenn> {
  @override
  void initState() {
    super.initState();
    // Navigate to the home screen after a delay of 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'RepoLens',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
