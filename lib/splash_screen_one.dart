import 'dart:async';
import 'package:flutter/material.dart';
import 'package:new_flutter_project/dashboard_page.dart';
import 'package:new_flutter_project/login_page.dart';

class SplashScreenOne extends StatefulWidget {
  const SplashScreenOne({super.key});
  @override
  SplashOne createState() => SplashOne();
}

class SplashOne extends State<SplashScreenOne>  {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer( const Duration(seconds: 3), () =>
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const LoginPage())),
        //     PageRouteBuilder(
        //   pageBuilder: (context, animation, secondaryAnimation) =>  const SplashScreenTwo(),
        //   transitionsBuilder: (context, animation, secondaryAnimation, child) {
        //     const begin = Offset(0.0, .5);
        //     const end = Offset(0.0, 0.0);
        //
        //     const curve = Curves.easeInOut;
        //
        //     var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        //     return SlideTransition(
        //       position: animation.drive(tween),
        //       child: child,
        //     );
        //   },
        // )),
        // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const SplashScreenTwo()));
    );
    var assetsImage =   const AssetImage("assets/splash.png"); //<- Creates an object that fetches an image.
    var image = Image(fit: BoxFit.fill,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
        image: assetsImage,
    ); //<- Creates a widget that displays an image.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        /* appBar: AppBar(
          title: Text("MyApp"),
          backgroundColor:
              Colors.blue, //<- background color to combine with the picture :-)
        ),*/
        body: Container(
          decoration:   const BoxDecoration(color: Colors.white),
          child:  Center(
            child: image,
          ),
        ), //<- place where the image appears
      ),
    );
  }
}

// Route _createNewRoute() {
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) =>  const SplashScreenTwo(),
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       const begin = Offset(0.0, .5);
//       const end = Offset(0.0, 0.0);
//
//       const curve = Curves.easeInOut;
//
//       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//       return SlideTransition(
//         position: animation.drive(tween),
//         child: child,
//       );
//     },
//   );
// }