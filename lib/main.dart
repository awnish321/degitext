import 'package:flutter/material.dart';
import 'package:new_flutter_project/splash_screen_one.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold
        (
        body: SplashScreenOne(),
      ),
    );
  }
}

