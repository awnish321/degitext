import 'package:flutter/material.dart';
import 'package:new_flutter_project/add_new_address_page.dart';
import 'package:new_flutter_project/utility/CustomColour.dart';

class SavedAddress extends StatelessWidget {
  const SavedAddress({super.key});

  @override
  Widget build(BuildContext context) {

    const notificationColour = Color(0xFFD7D7D7);

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
          title: const Text('Saved Address'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                color: notificationColour,
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                        Text('Awnish kumar  ',
                        style: TextStyle(
                            color: Colors.black54, fontSize: 15.0,fontWeight: FontWeight.bold,),
                      ),
                        SizedBox(height: 3),
                        Text('8210260336  ',
                        style: TextStyle(
                            color: Colors.black54, fontSize: 15.0,fontWeight: FontWeight.bold,),
                      ),
                      SizedBox(height: 5),
                      Text('4583/15, Daryaganj, New Delhi – 110002, INDIA  ',
                        style: TextStyle(
                            color: Colors.black54, fontSize: 15.0),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: notificationColour,
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                        Text('Awnish kumar  ',
                        style: TextStyle(
                            color: Colors.black54, fontSize: 15.0,fontWeight: FontWeight.bold,),
                      ),
                        SizedBox(height: 3),
                        Text('8210260336  ',
                        style: TextStyle(
                            color: Colors.black54, fontSize: 15.0,fontWeight: FontWeight.bold,),
                      ),
                      SizedBox(height: 5),
                      Text('4583/15, Daryaganj, New Delhi – 110002, INDIA  ',
                        style: TextStyle(
                            color: Colors.black54, fontSize: 15.0),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: notificationColour,
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                        Text('Awnish kumar  ',
                        style: TextStyle(
                            color: Colors.black54, fontSize: 15.0,fontWeight: FontWeight.bold,),
                      ),
                        SizedBox(height: 3),
                        Text('8210260336  ',
                        style: TextStyle(
                            color: Colors.black54, fontSize: 15.0,fontWeight: FontWeight.bold,),
                      ),
                      SizedBox(height: 5),
                      Text('4583/15, Daryaganj, New Delhi – 110002, INDIA  ',
                        style: TextStyle(
                            color: Colors.black54, fontSize: 15.0),
                      ),
                    ],
                  ),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(style:  const ButtonStyle(backgroundColor: MaterialStatePropertyAll(CustomColour.appTheme)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const AddNewAddress()));
                    },
                    child: const Text('Add+'),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
