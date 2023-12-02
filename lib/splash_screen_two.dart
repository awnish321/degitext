import 'dart:async';
import 'package:flutter/material.dart';
import 'package:new_flutter_project/login_page.dart';

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
    Timer(const Duration(seconds: 3), () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const LoginPage())));
    var assetsImage =  const AssetImage("assets/splashs.png"); //<- Creates an object that fetches an image.
    var image = Image(fit: BoxFit.fill,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
        image: assetsImage,); //<- Creates a widget that displays an image.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        /* appBar: AppBar(
          title: Text("MyApp"),
          backgroundColor:
              Colors.blue, //<- background color to combine with the picture :-)
        ),*/
        body: Container(
          decoration:  const BoxDecoration(color: Colors.white),
          child:  Center(
            child: image,
          ),
        ), //<- place where the image appears
      ),
    );
  }
}