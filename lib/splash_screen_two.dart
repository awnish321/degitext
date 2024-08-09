import 'dart:async';
import 'package:flutter/material.dart';
import 'package:digi_text/login_page.dart';

class SplashScreenTwo extends StatefulWidget {
  const SplashScreenTwo({super.key});
  @override
  SplashTwo createState() => SplashTwo();
}

class SplashTwo extends State<SplashScreenTwo>  {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 3), () =>
        Navigator.of(context).pushReplacement(_createNewRoute()),
        // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const LoginPage()))
    );

    var assetsImage =  const AssetImage("assets/splashs.png"); //<- Creates an object that fetches an image.
    var image = Image(fit: BoxFit.fill,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
        image: assetsImage,); //<- Creates a widget that displays an image.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: image
        ),
      ),
    );
  }

}

Route _createNewRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const LoginPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 1.0);
      const end = Offset(0.0, 0.0);
      const curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}