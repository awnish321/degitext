import 'package:flutter/material.dart';

import 'utility/CustomColour.dart';
import 'login_page.dart';

class test extends StatelessWidget {
   const test(String data, {super.key});
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(primarySwatch: CustomColour.appTheme),
      darkTheme: ThemeData(brightness: Brightness.dark, primarySwatch: CustomColour.appTheme),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title:  const Text('RACHNA SAGAR PVT. LTD'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
        ),
        body:
        Column(
          children: [
            (
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: CustomColour.appTheme,
                  ),
                  child: const Text(
                    'Skip',
                    style: TextStyle(fontSize: 20),textAlign: TextAlign.end,
                  ),
                  onPressed: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  },
                )
            ),
          ],
        ),
        drawer: Drawer
          (
          child: ListView
            (
            padding: const EdgeInsets.all(0),
            children:
            [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: CustomColour.appTheme,
                ), //BoxDecoration
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: CustomColour.appTheme),
                  accountName: Text(
                    "Awnish Kumar",
                    style: TextStyle(fontSize: 18),
                  ),
                  accountEmail: Text("Awnish@gmail.com"),
                  currentAccountPictureSize: Size.square(50),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      "A",
                      style: TextStyle(fontSize: 30.0, color: CustomColour.appTheme),
                    ), //Text
                  ), //circleAvatar
                ), //UserAccountDrawerHeader
              ), //DrawerHeader
              ListTile(
                leading: const Icon(Icons.person),
                iconColor: CustomColour.appTheme,
                title: const Text(' My Profile '),
                textColor: CustomColour.appTheme,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.book),
                iconColor: CustomColour.appTheme,
                title: const Text(' My Class '),
                textColor: CustomColour.appTheme,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.workspace_premium),
                iconColor: CustomColour.appTheme,
                title: const Text(' Ebook '),
                textColor: CustomColour.appTheme,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.video_label),
                iconColor: CustomColour.appTheme,
                title: const Text(' Saved Videos '),
                textColor: CustomColour.appTheme,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit),
                iconColor: CustomColour.appTheme,
                title: const Text(' Edit Profile '),
                textColor: CustomColour.appTheme,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                iconColor: CustomColour.appTheme,
                title: const Text('LogOut'),
                textColor: CustomColour.appTheme,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
