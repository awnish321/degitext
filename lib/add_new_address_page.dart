import 'package:flutter/material.dart';
import 'package:new_flutter_project/utility/CustomColour.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Add New Address';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
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
          title: const Text(appTitle,style: TextStyle(color: Colors.white),),
          centerTitle: true,
        ),
        body: const AddAddress(),
      ),
    );
  }
}

// Create a Form widget.
class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<AddAddress> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person,color: CustomColour.appTheme),
                  hintText: 'Enter your full name',
                  labelText: 'Name', labelStyle: TextStyle(
                    color: CustomColour.appTheme,decorationColor: CustomColour.appTheme
                ),enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: CustomColour.appTheme),
                ),focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54),
                ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.phone,color: CustomColour.appTheme),
                  hintText: 'Enter a phone number',
                  labelText: 'Phone', labelStyle:TextStyle(
                    color: CustomColour.appTheme,decorationColor: CustomColour.appTheme
                ),enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: CustomColour.appTheme),
                ),focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54),
                ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter valid phone number';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.account_balance,color: CustomColour.appTheme),
                  hintText: 'Enter a Address',
                  labelText: 'Address', labelStyle:TextStyle(
                    color: CustomColour.appTheme,decorationColor: CustomColour.appTheme
                ),enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: CustomColour.appTheme),
                ),focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54),
                ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Address';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.landscape,color: CustomColour.appTheme),
                  hintText: 'Landmark',
                  labelText: 'Landmark', labelStyle:TextStyle(
                    color: CustomColour.appTheme,decorationColor: CustomColour.appTheme
                ),enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: CustomColour.appTheme),
                ),focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54),
                ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Landmark';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.pin,color: CustomColour.appTheme),
                  hintText: 'Enter your Pin Code',
                  labelText: 'Pin Code', labelStyle: TextStyle(
                    color: CustomColour.appTheme,decorationColor: CustomColour.appTheme
                ),enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: CustomColour.appTheme),
                ),focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54),
                ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter valid Pin Code';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.map,color: CustomColour.appTheme),
                  hintText: 'Enter your State',
                  labelText: 'State', labelStyle: TextStyle(
                    color: CustomColour.appTheme,decorationColor: CustomColour.appTheme
                ),enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: CustomColour.appTheme),
                ),focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54),
                ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter valid State Name';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.language,color: CustomColour.appTheme),
                  hintText: 'Enter your Country',
                  labelText: 'Country', labelStyle: TextStyle(
                  color: CustomColour.appTheme,decorationColor: CustomColour.appTheme,
                ),enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: CustomColour.appTheme),
                ),focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54),
                ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Your Country Name';
                  }
                  return null;
                },
              ),
              // TextFormField(
              //   decoration: const InputDecoration(
              //     icon: Icon(Icons.calendar_today),
              //     hintText: 'Enter your date of birth',
              //     labelText: 'Dob',
              //   ),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter valid date';
              //     }
              //     return null;
              //   },
              // ),
              const SizedBox(height: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(style: ElevatedButton.styleFrom(shape: const ContinuousRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                    foregroundColor: Colors.white, backgroundColor: CustomColour.appTheme, // foreground
                  ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    child: const Text('Submit'),
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
