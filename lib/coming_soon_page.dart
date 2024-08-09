import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:digi_text/utility/CustomColour.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColour.appTheme,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_sharp,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
          title: const Text('Coming Soon',style: TextStyle(color: Colors.white),),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Lottie.asset('animation/coming_soon.json',height: 200,reverse: true,repeat: true,fit: BoxFit.cover),
              Lottie.asset('animation/coming_soon1.json',height:100,reverse: true,repeat: true,fit: BoxFit.cover)
            ],
          ),
        ),
      ),
    );
  }
}