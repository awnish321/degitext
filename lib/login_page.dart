import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:new_flutter_project/forget_detail.dart';
import 'package:new_flutter_project/sign_up_page.dart';
import 'package:new_flutter_project/web_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model/UserDetailModel.dart';
import 'utility/CustomColour.dart';
import 'dashboard_page.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io' show Platform;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _userExist = false;

  @override
  void initState() {
    super.initState();
    _loadData();
    initDeviceInfo();
  }

  void _loadData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var user = UserDetailModel.fromJson(pref.getString('userData'));
    if (user.status == "true") {
      setState(() {
        _userExist = true;
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DashBoard()));
      });
    }
  }

  String deviceName = '';
  String deviceVersion = '';
  String deviceId = ''; // Unique device ID

  Future<void> initDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      setState(() {
        deviceName = androidInfo.model ?? 'Unknown';
        deviceVersion = androidInfo.version.release ?? 'Unknown';
        deviceId = androidInfo.id ?? 'Unknown'; // using 'id' instead of 'androidId'
      });
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      setState(() {
        deviceName = iosInfo.name ?? 'Unknown';
        deviceVersion = iosInfo.systemVersion ?? 'Unknown';
        deviceId = iosInfo.identifierForVendor ?? 'Unknown';
      });
    }
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email, password) async {

    print(deviceId);
    print(deviceVersion);
    print(deviceName);

    Map<String, String> headers = {'rsplkey': 'rspl','utoken': 'UserLogin', 'Content-Type': 'application/json' };
    final msg = jsonEncode(
        {"email": email, "password": password, "mDeviceId": deviceId, "mId": deviceId, "mProduct": deviceVersion, "mBrand": deviceName, "mManufacture": deviceName, "mModel": deviceName, "action": "login"});
    try {
      Response response = await post(
        Uri.parse('https://www.rachnasagar.in/digitextapp/api/flutter/login'),
        headers: headers,
        body: msg,
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['status'] == "true") {
          SharedPreferences pref = await SharedPreferences.getInstance();
          Map json = jsonDecode(data);
          String user = jsonEncode(UserDetailModel.fromJson(json));
          pref.setString('userData', user);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashBoard()),);
        } else {
          {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Username or password is wrong")));
          }
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("failed twice")));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("something went wrong please try again")));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("failed")));
    }
  }

  static const themeColour = Color(0xFFEA6865);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColour.appTheme,
          iconTheme: const IconThemeData(color: Colors.white),
          leading: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/logo.png'),
            ),
          ),
          title: const Text(
            'RACHNA SAGAR PVT. LTD', style: TextStyle(color: Colors.white),),
          centerTitle: true,
        ),
        body: Stack(children: <Widget>[
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
                  Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => DashBoard()),);
                },
              )
            ],
          ),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Login',
                style: TextStyle(color: CustomColour.appTheme,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
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
          Container(alignment: Alignment.bottomRight,
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: CustomColour.appTheme,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ForgetDetailPage()),
                );
              },
              child: const Text(
                'Forgot Password',
              ),
            ),
          ),
          Container(
              height: 50, margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const ContinuousRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  foregroundColor: Colors.white,
                  backgroundColor: CustomColour.appTheme, // foreground
                ),
                child: const Text('Login'),
                onPressed: () {
                  var userName = nameController.text.trim().toString();
                  var userPassword = passwordController.text.trim()
                      .toString();
                  if (userName.isEmpty || userPassword.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text(
                            "Please enter user name and password to proceed")));
                  } else {
                    login(userName, userPassword);
                  }

                  // var user = "good";
                  // var password = "123";
                  // setState(() {
                  //   userName == user ? _validate = true : _validate = false;
                  //   userPassword == password ? _validate = true : _validate = false;
                  // });
                  // if(userName ==user && userPassword == password){
                  //   Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => const DashBoard()),
                  //   );
                  // }else{
                  //   showDialog(
                  //     context: context,
                  //     builder: (BuildContext context) {
                  //       return AlertDialog(
                  //         title: const Text("Alert Dialog"),
                  //         content: const Text("User name/Email or Password is wrong"),
                  //         actions: [
                  //           TextButton(
                  //             child: const Text("Close"),
                  //             onPressed: () {
                  //               Navigator.of(context).pop();
                  //             },
                  //           )
                  //         ],
                  //       );
                  //     },
                  //   );
                  // }
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
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const SignUpPage()),
                  );
                },
              )
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(flex: 1,
                child: Container(
                    height: 50,
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const ContinuousRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(15))),
                        foregroundColor: Colors.white,
                        backgroundColor: CustomColour
                            .appTheme, // foreground
                      ),
                      child: const Text('Privacy Policy'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const WebViewApp()));
                      },
                    )
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                    height: 50,
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const ContinuousRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(15))),
                        foregroundColor: Colors.white,
                        backgroundColor: CustomColour
                            .appTheme, // foreground
                      ),
                      child: const Text('About Us'),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Alert Dialog"),
                              content: const Text(
                                  "User name/Email or Password is wrong"),
                              actions: [
                                TextButton(
                                  child: const Text("Close"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            );
                          },
                        );
                      },
                    )
                ),
              ),
            ],
          ),
        ],
      ),
        ),
        ]),
    );
  }
}
