import 'package:flutter/material.dart';
import 'package:new_flutter_project/main.dart';

import 'utility/CustomColour.dart';
import 'dashboard_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  int _radioSelected = 1;
  late String radioVal="Student";

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
                    'SignUp',
                    style: TextStyle(
                        color: CustomColour.appTheme,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  style: const TextStyle(color: CustomColour.appTheme),
                  controller: nameController,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: CustomColour.appTheme),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: CustomColour.appTheme),
                    ),
                    labelText: ' Enter Your Name',
                    labelStyle: TextStyle(color: CustomColour.appTheme),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  style: const TextStyle(color: CustomColour.appTheme),
                  obscureText: true,
                  controller: mobileController,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: CustomColour.appTheme),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: CustomColour.appTheme),
                      ),
                      labelText: 'Enter your Mobile',
                      // errorText: _validate ? 'User name\'is wrong' : null,
                      labelStyle: TextStyle(
                        color: CustomColour.appTheme,
                      )),
                ),
              ),
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
                padding: const EdgeInsets.all(5),
                child: TextField(
                  style: const TextStyle(color: CustomColour.appTheme),
                  obscureText: true,
                  controller: addressController,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: CustomColour.appTheme),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: CustomColour.appTheme),
                      ),
                      labelText: 'Enter your Address',
                      // errorText: _validate ? 'User name\'is wrong' : null,
                      labelStyle: TextStyle(
                        color: CustomColour.appTheme,
                      )),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  style: const TextStyle(color: CustomColour.appTheme),
                  controller: cityController,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: CustomColour.appTheme),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: CustomColour.appTheme),
                    ),
                    labelText: ' Enter Your City',
                    // errorText: _validate ? 'User name\'is wrong' : null,
                    labelStyle: TextStyle(color: CustomColour.appTheme),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  style: const TextStyle(color: CustomColour.appTheme),
                  obscureText: true,
                  controller: stateController,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: CustomColour.appTheme),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: CustomColour.appTheme),
                      ),
                      labelText: 'Enter your State',
                      // errorText: _validate ? 'User name\'is wrong' : null,
                      labelStyle: TextStyle(
                        color: CustomColour.appTheme,
                      )),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  style: const TextStyle(color: CustomColour.appTheme),
                  controller: pinCodeController,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: CustomColour.appTheme),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: CustomColour.appTheme),
                    ),
                    labelText: ' Enter Your Pincode',
                    // errorText: _validate ? 'User name\'is wrong' : null,
                    labelStyle: TextStyle(color: CustomColour.appTheme),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  style: const TextStyle(color: CustomColour.appTheme),
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: CustomColour.appTheme),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: CustomColour.appTheme),
                      ),
                      labelText: 'Password',
                      // errorText: _validate ? 'User name\'is wrong' : null,
                      labelStyle: TextStyle(
                        color: CustomColour.appTheme,
                      )),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: CustomColour.appTheme),
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.black12, //add it here
                ),
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(10),
                child: const Text("You Are",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: CustomColour.appTheme)),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        const Text('Student'),
                        Radio(
                          value: 1,
                          groupValue: _radioSelected,
                          activeColor: CustomColour.appTheme,
                          onChanged: (value) {
                            setState(() {
                              _radioSelected = value!;
                              radioVal = 'Student';
                            });
                          },
                        ),
                        const Text('Teacher'),
                        Radio(
                          value: 2,
                          groupValue: _radioSelected,
                          activeColor: CustomColour.appTheme,
                          onChanged: (value) {
                            setState(() {
                              _radioSelected = value!;
                              radioVal = 'Teacher';
                            });
                          },
                        ),
                        const Text('Parent'),
                        Radio(
                          value: 3,
                          groupValue: _radioSelected,
                          activeColor: CustomColour.appTheme,
                          onChanged: (value) {
                            setState(() {
                              _radioSelected = value!;
                              radioVal = 'parent';
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('School'),
                        Radio(
                          value: 4,
                          groupValue: _radioSelected,
                          activeColor: CustomColour.appTheme,
                          onChanged: (value) {
                            setState(() {
                              _radioSelected = value!;
                              radioVal = 'School';
                            });
                          },
                        )
                      ],
                    ),
                  ],
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
                    child: const Text('Sign Up'),
                    onPressed: () {
                      var userName = nameController.text.trim().toString();
                      var userMobile = mobileController.text.trim().toString();
                      var userEmail = emailController.text.trim().toString();
                      var userAddress = addressController.text.trim().toString();
                      var userCity = cityController.text.trim().toString();
                      var userState = stateController.text.trim().toString();
                      var userPinCode = pinCodeController.text.trim().toString();
                      var userPassword = passwordController.text.trim().toString();
                      var userType = radioVal.toString();

                      setSignUpState(
                          userName,
                          userMobile,
                          userEmail,
                          userAddress,
                          userCity,
                          userState,
                          userPinCode,
                          userPassword,
                          userType,
                          context);
                    },
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Already a user'),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: CustomColour.appTheme,
                    ),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp()),
                      );
                    },
                  )
                ],
              ),
            ]
        ),
      ),
    );
  }

  void setSignUpState(
      String name,
      String mobile,
      String email,
      String address,
      String city,
      String state,
      String pinCode,
      String password,
      String type,
      BuildContext context
      ) {
    if (name.isNotEmpty &&
        mobile.isNotEmpty &&
        email.isNotEmpty &&
        address.isNotEmpty &&
        city.isNotEmpty &&
        state.isNotEmpty &&
        pinCode.isNotEmpty &&
        password.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DashBoard()),
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
