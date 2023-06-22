import 'package:flutter/material.dart';
import 'package:new_flutter_project/forget_detail.dart';
import 'package:new_flutter_project/sign_up_page.dart';
import 'package:new_flutter_project/web_page.dart';
import 'utility/CustomColour.dart';
import 'dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _validate = false;
  static const themeColour = Color(0xFFEA6865);

  @override
  Widget build(BuildContext context) {
    return
      Stack(children: <Widget>[
        SingleChildScrollView(padding: const EdgeInsets.all(10),
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: CustomColour.appTheme,
                    ),
                    child: const Text(
                      'Skip',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const DashBoard()),
                      );
                    },
                  )
                ],
              ),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Login',
                    style: TextStyle(color: CustomColour.appTheme, fontSize: 22,fontWeight: FontWeight.bold),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(cursorColor: Colors.black,
                  controller: nameController,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: themeColour),
                    ),
                    labelText: 'User Name/Email',
                    // errorText: _validate ? 'User name\'is wrong' : null,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(cursorColor: Colors.black,
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: themeColour),
                      ),
                      labelText: 'Password',
                      // errorText: _validate ? 'User name\'is wrong' : null,
                  ),
                ),
              ),
              Container(alignment: Alignment.bottomRight,margin: const EdgeInsets.symmetric(vertical: 15),
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: CustomColour.appTheme,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ForgetDetailPage()),
                    );
                  },
                  child: const Text(
                    'Forgot Password',
                  ),
                ),
              ),
              Container(
                  height: 50,margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: CustomColour.appTheme, // foreground
                    ),
                    child: const Text('Login'),
                    onPressed: () {
                      var userName = nameController.text.trim().toString();
                      var userPassword = passwordController.text.trim().toString();
                      var user = "good";
                      var password = "123";

                      setState(() {
                        userName == user ? _validate = true : _validate = false;
                        userPassword == password ? _validate = true : _validate = false;
                      });
                      if(userName ==user && userPassword == password){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const DashBoard()),
                        );
                      }else{
                        print("user name or password wrong");
                      }
                    },
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Does not have account?'),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: CustomColour.appTheme,
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUpPage()),
                      );
                    },
                  )
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(flex: 1,
                    child: Container(
                        height: 50,margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white, backgroundColor: CustomColour.appTheme, // foreground
                          ),
                          child: const Text('Privacy Policy'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  const WebViewApp()));
                          },
                        )
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                        height: 50,margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white, backgroundColor: CustomColour.appTheme, // foreground
                          ),
                          child: const Text('About Us'),
                          onPressed: () {

                          },
                        )
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ],
      );
  }
}