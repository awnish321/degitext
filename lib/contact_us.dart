import 'package:flutter/material.dart';
import 'package:new_flutter_project/utility/CustomColour.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

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
          title: const Text('Contact Us'),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 270.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/help.png"),
                  fit: BoxFit.cover,
                ),
              ),
            )     ,
            const SizedBox(
              height: 10,
              ),
            Column(
              children: const <Widget>[
                ListTile(
                  title: Text(
                    'Email',
                    style: TextStyle(
                      color: CustomColour.appTheme,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'info@rachnasagar.in',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Divider(thickness: 1.2,height: 0),
                ListTile(
                  title: Text(
                    'Phone',
                    style: TextStyle(
                      color: CustomColour.appTheme,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '+91-11-43585858 , 23285568 , 23243519',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Divider(thickness: 1.2,height: 0),
                ListTile(
                  title: Text(
                    'Whats Up',
                    style: TextStyle(
                      color: CustomColour.appTheme,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '9717998871',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Divider(thickness: 1.2,height: 0),
                ListTile(
                  title: Text(
                    'Website',
                    style: TextStyle(
                      color: CustomColour.appTheme,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'https://www.rachnasagar.in/',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Divider(thickness: 1.2,height: 0),
                ListTile(
                  title: Text(
                    'Head Office',
                    style: TextStyle(
                      color: CustomColour.appTheme,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '4583/15, Daryaganj, New Delhi – 110002, INDIA',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Divider(thickness: 1.2,height: 0),
              ],
            )
          ],
            ),
        ),
    );
  }
}