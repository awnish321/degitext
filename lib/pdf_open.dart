import 'package:flutter/material.dart';
import 'package:new_flutter_project/utility/CustomColour.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://www.rachnasagar.in/assets/pdf/ebook.pdf');

class OpenPdf extends StatelessWidget {
  const OpenPdf({super.key});

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
          title: const Text('Pdf Page',style: TextStyle(color: Colors.white),),
          centerTitle: true,
        ),
        body: const Center(
          child: ElevatedButton(
            onPressed: _launchUrl,
            child: Text('Show Flutter homepage'),
          ),
        ),
      ),
    );
  }
}

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
