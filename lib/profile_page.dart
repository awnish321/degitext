import 'package:flutter/material.dart';
import 'package:new_flutter_project/utility/CustomColour.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  static const notificationColour = Color(0xFFD7D7D7);

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
          title: const Text('My Profile'),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 250,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [notificationColour, notificationColour],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.5, 0.9],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: const <Widget>[
                  //     CircleAvatar(
                  //       backgroundColor: Colors.white70,
                  //       minRadius: 65.0,
                  //       child: CircleAvatar(
                  //         radius: 60.0,
                  //         backgroundImage: NetworkImage(
                  //             'https://avatars0.githubusercontent.com/u/28812093?s=460&u=06471c90e03cfd8ce2855d217d157c93060da490&v=4'),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Stack(
                    children: [
                      const SizedBox(
                        width: 130,
                        height: 130,
                        child: CircleAvatar(
                          backgroundColor: CustomColour.appTheme,
                          minRadius: 65.0,
                          child: CircleAvatar(
                            radius: 60.0,
                            backgroundImage: NetworkImage(
                                'https://avatars0.githubusercontent.com/u/28812093?s=460&u=06471c90e03cfd8ce2855d217d157c93060da490&v=4'),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: CustomColour.appTheme),
                            child: IconButton(
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 20,
                              ),
                              onPressed: () {
                                // do something
                              },
                            )
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Awnish Kumar',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: CustomColour.appTheme,
                    ),
                  ),
                  const Text(
                    'Teacher',
                    style: TextStyle(
                      color: CustomColour.appTheme,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
            const ListTile(
              minLeadingWidth: 0,
              leading: Icon(Icons.email),
              iconColor: CustomColour.appTheme,
              title: Text(' Awnish321@gmail.com ',style: TextStyle(fontWeight: FontWeight.bold)),
              textColor: Colors.black45,
            ),
            const Divider(thickness: 1.2,height: 0),
            const ListTile(
              minLeadingWidth: 0,
              leading: Icon(Icons.phone_android),
              iconColor: CustomColour.appTheme,
              title: Text(' 8210260336 ',style: TextStyle(fontWeight: FontWeight.bold)),
              textColor: Colors.black45,
            ),
            const Divider(thickness: 1.2,height: 0),
            const ListTile(
              minLeadingWidth: 0,
              leading: Icon(Icons.web_stories_rounded),
              iconColor: CustomColour.appTheme,
              title: Text(' Delhi ',style: TextStyle(fontWeight: FontWeight.bold)),
              textColor: Colors.black45,
            ),
            const Divider(thickness: 1.2,height: 0),
            const ListTile(
              minLeadingWidth: 0,
              leading: Icon(Icons.map),
              iconColor: CustomColour.appTheme,
              title: Text(' New Delhi ',style: TextStyle(fontWeight: FontWeight.bold)),
              textColor: Colors.black45,
            ),
            const Divider(thickness: 1.2,height: 0),
            const ListTile(
              minLeadingWidth: 0,
              leading: Icon(Icons.language),
              iconColor: CustomColour.appTheme,
              title: Text(' India ',style: TextStyle(fontWeight: FontWeight.bold)),
              textColor: Colors.black45,
            ),
            const Divider(thickness: 1.2,height: 0),
          ],
        ),
      ),
    );
  }
}