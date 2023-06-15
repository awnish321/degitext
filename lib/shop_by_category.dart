import 'package:flutter/material.dart';
import 'package:new_flutter_project/utility/CustomColour.dart';

class ShopByCategory extends StatefulWidget {
  const ShopByCategory({Key? key}) : super(key: key);

  @override
  State<ShopByCategory> createState() => _ShopByCategoryState();
}

class _ShopByCategoryState extends State<ShopByCategory> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  int _selectedIndex = 0;
  String radioButtonItem = 'Student';
  int id = 1;
  String dropDownValue = 'Class 1';
  var items = [
    'Class 1',
    'Class 2',
    'Class 3',
    'Class 4',
    'Class 5',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: CustomColour.appTheme),
      darkTheme: ThemeData(brightness: Brightness.dark, primarySwatch: CustomColour.appTheme),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('RACHNA SAGAR PVT. LTD'),
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
        body: SingleChildScrollView(padding: const EdgeInsets.all(10),
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container( width: double.infinity,
                height: 50,margin: const EdgeInsets.only(top: 3,left: 10,right: 10),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffc9c1c1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Search for Items",
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: Colors.black,
                  ),
                ),
              ),
              Container(width: double.infinity,margin: const EdgeInsets.all(10),
                  alignment: Alignment.center, decoration: BoxDecoration(
                      color: CustomColour.appTheme,
                      border: Border.all(
                          color:CustomColour.appTheme, // Set border color
                          width: 3.0),   // Set border width
                      borderRadius: const BorderRadius.all(
                          Radius.circular(10.0)), // Set rounded corner radius
                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'CBSE',
                    style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold,),
                  )
              ),
              Container(margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Card(
                  elevation: 1,
                  shadowColor: Colors.black,
                  color: Colors.grey[200],
                  child: Container(margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.stretch,
                      children: [
                        DropdownButton(
                          isExpanded: true,
                          value: dropDownValue,
                          icon:
                          const Icon(Icons.keyboard_arrow_down),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropDownValue = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Card(
                  elevation: 1,
                  shadowColor: Colors.black,
                  color: Colors.grey[200],
                  child: Container(margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.stretch,
                      children: [
                        DropdownButton(
                          isExpanded: true,
                          value: dropDownValue,
                          icon:
                          const Icon(Icons.keyboard_arrow_down),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropDownValue = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Card(
                  elevation: 1,
                  shadowColor: Colors.black,
                  color: Colors.grey[200],
                  child: Container(margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.stretch,
                      children: [
                        DropdownButton(
                          isExpanded: true,
                          value: dropDownValue,
                          icon:
                          const Icon(Icons.keyboard_arrow_down),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropDownValue = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(margin: const EdgeInsets.all(10),height: 300,color: CustomColour.appTheme,alignment: Alignment.bottomCenter,
                        child: const Text(
                          'CBSE',
                          style: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold,),

                        ),
                    ),
                  ),
                  Expanded(
                    child: Container(margin: const EdgeInsets.all(10),height: 300,color: CustomColour.appTheme,alignment: Alignment.bottomCenter,
                        child: const Text(
                          'CBSE',
                          style: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold,),
                        )
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
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
                      style:
                      TextStyle(fontSize: 30.0, color: CustomColour.appTheme),
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
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedIconTheme:
          const IconThemeData(color: CustomColour.appTheme, size: 40),
          selectedItemColor: CustomColour.appTheme,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedItemColor: Colors.black54,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.book_online),
              label: ("Our Product"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.import_contacts_rounded),
              label: ("Read E-Book"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_sharp),
              label: ("Notification"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: ("Account"),
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}