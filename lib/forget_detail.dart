import 'package:flutter/material.dart';
import 'utility/CustomColour.dart';
import 'dashboard_page.dart';

class ForgetDetailPage extends StatelessWidget {
  const ForgetDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: CustomColour.appTheme),
      darkTheme: ThemeData(brightness: Brightness.dark, primarySwatch: CustomColour.appTheme),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/logo.png'),
          ),
        ),
        title: const Text('RACHNA SAGAR PVT. LTD'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
            children:<Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(5),
                  child: const Text(
                    'Forget Password',
                    style: TextStyle(
                        color: CustomColour.appTheme,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  style: const TextStyle(color: CustomColour.appTheme),
                  controller: emailController,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: CustomColour.appTheme),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: CustomColour.appTheme),
                    ),
                    labelText: ' Enter Your Email',
                    // errorText: _validate ? 'User name\'is wrong' : null,
                    labelStyle: TextStyle(color: CustomColour.appTheme),
                  ),
                ),
              ),
              Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: CustomColour.appTheme, // foreground
                    ),
                    child: const Text('Submit'),
                    onPressed: () {
                      var userEmail = emailController.text.trim().toString();
                      setSignUpState(userEmail, context);
                    },
                  )),
            ]
        ),
      ),
    );
  }

  void setSignUpState(String email, BuildContext context) {
    if (
        email.isNotEmpty )
    {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const DashBoard()),
      );
    } else {
      showErrorDialog(context);
    }
  }

  void showErrorDialog(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('AlertDialog Title'),
        content: const Text('AlertDialog description'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel1'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK1'),
          ),
        ],
      ),
    );
  }

}