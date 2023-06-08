import 'package:flutter/material.dart';
import 'package:new_flutter_project/login_page.dart';
import 'utility/CustomColour.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title = 'RACHNA SAGAR PVT.LTD.';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: CustomColour.appTheme),
      darkTheme: ThemeData(brightness: Brightness.dark, primarySwatch: CustomColour.appTheme),
      title: _title,
      debugShowCheckedModeBanner: false,
      home: Scaffold
        (
        appBar: AppBar(
          leading: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/logo.png'),
            ),
          ),
          title:  const Text('RACHNA SAGAR PVT. LTD'),
          centerTitle: true,
        ),
        body: const LoginPage(),
      ),
    );
  }
}

