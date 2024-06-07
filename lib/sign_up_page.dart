import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:new_flutter_project/login_page.dart';
import 'package:new_flutter_project/main.dart';
import 'utility/CustomColour.dart';
import 'dashboard_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: CustomColour.appTheme,
        iconTheme: const IconThemeData(color: Colors.white),
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/logo.png'),
          ),
        ),
        title: const Text('RACHNA SAGAR PVT. LTD',style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child:const ConditionalWidget(),
      ),
    );
  }
}

class ConditionalWidget extends StatefulWidget {
  const ConditionalWidget({super.key});
@override
  State<ConditionalWidget> createState() => _ConditionalWidgetState();
}

class _ConditionalWidgetState extends State<ConditionalWidget> {

  TextEditingController nameController = TextEditingController();

  TextEditingController mobileController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController countryController = TextEditingController();

  TextEditingController cityController = TextEditingController();

  TextEditingController stateController = TextEditingController();

  TextEditingController pinCodeController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  int _radioSelected = 1;

  String radioVal="student";

  bool isLoading =false;

  @override
  Widget build(BuildContext context) {
    return Center(child: isLoading ?  bodyProgress : ListView(
        children:<Widget>[
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 10),
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
              controller: countryController,
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: CustomColour.appTheme),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: CustomColour.appTheme),
                  ),
                  labelText: 'Enter your Country',
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
                          radioVal = 'student';
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
                          radioVal = 'teacher';
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
                          radioVal = 'school';
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
                style: ElevatedButton.styleFrom(shape: const ContinuousRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                  foregroundColor: Colors.white, backgroundColor: CustomColour.appTheme, // foreground
                ),
                child: const Text('Sign Up'),
                onPressed: () {
                  setState(() {
                    isLoading=true;
                  });
                  var userName = nameController.text.trim().toString();
                  var userEmail = emailController.text.trim().toString();
                  var userPassword = passwordController.text.trim().toString();
                  var userMobile = mobileController.text.trim().toString();
                  var userCountry = countryController.text.trim().toString();
                  var userState = stateController.text.trim().toString();
                  var userCity = cityController.text.trim().toString();
                  var userPinCode = pinCodeController.text.trim().toString();
                  var userAddress = addressController.text.trim().toString();
                  var userType = radioVal.trim().toString();
                  var action = "register";
                  setSignUpState(userName, userEmail, userPassword, userMobile, userCountry, userState, userCity, userPinCode, userAddress, userType, action,);
                },
              )
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     const Text('Already a user'),
          //     TextButton(
          //       style: TextButton.styleFrom(
          //         foregroundColor: CustomColour.appTheme,
          //       ),
          //       child: const Text(
          //         'Sign In',
          //         style: TextStyle(fontSize: 20),
          //       ),
          //       onPressed: () {
          //         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyApp()),
          //         );
          //       },
          //     )
          //   ],
          // ),
        ]
    ));
  }

  void setSignUpState(String name, String email, String password, String mobile, String country, String state, String city, String pinCode, String address, String type, String action) {
    if (name.isNotEmpty &&
        mobile.isNotEmpty &&
        email.isNotEmpty &&
        country.isNotEmpty &&
        address.isNotEmpty &&
        city.isNotEmpty &&
        state.isNotEmpty &&
        pinCode.isNotEmpty &&
        password.isNotEmpty) {
      signUp(name,email,password,mobile,country,state,city,pinCode,address,action,type);
    } else {
      setState(() {
        isLoading=false;
      });
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
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void signUp(String name, email,password,mobile,country,state,city,pinCode,address,type,action) async {
    Map<String,String> headers = {'rsplkey': 'rspl', 'utoken': 'Products', 'Content-Type': 'application/json'};
    final registerData = jsonEncode({"name" : name, "email" : email, "password" : password, "mobile": mobile, "country" : country, "state" : state, "city" : city, "zip" : pinCode, "address" : address, "usertype" : "student", "action" : "register"});
    try{
      Response response = await post(
        Uri.parse('https://www.rachnasagar.in/digitextapp/api/flutter/register'),
        headers: headers,
        body: registerData,
      );
      if(response.statusCode == 200){
        setState(() {
          isLoading=false;
        });
        var data = jsonDecode(response.body.toString());
        if(data['status']=="true")
        {
          ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(data['message'])));
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()),);
        }else{
          ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(data['message'])));
        }
      }else {
        setState(() {
          isLoading=false;
        });
        print('failed');
      }
    }catch(e){
      print(e.toString());
    }
  }

  var bodyProgress = Stack(
    children: <Widget>[
      Container(
        alignment: AlignmentDirectional.center,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Container(
          decoration:  BoxDecoration(
            // color: CustomColour.appTheme.shade100,
              borderRadius:  BorderRadius.circular(10.0)
          ),
          width: double.maxFinite,
          height: double.maxFinite,
          alignment: AlignmentDirectional.center,
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Center(
                child:  SizedBox(
                  height: 50.0,
                  width: 50.0,
                  child:  CircularProgressIndicator(
                    value: null,
                    strokeWidth: 5.0,color: CustomColour.appTheme,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 25.0),
                child:  const Center(
                  child:  Text(
                    "loading.. wait...",
                    style:  TextStyle(
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}