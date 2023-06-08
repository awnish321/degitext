import 'package:flutter/material.dart';

import 'utility/CustomColour.dart';
import 'login_page.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: CustomColour.appTheme),
      darkTheme: ThemeData(
          brightness: Brightness.dark, primarySwatch: CustomColour.appTheme),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // static List<String> testData = [
  //   "USA",
  //   "UK",
  //   "Uganda",
  //   "Uruguay",
  //   "United Arab Emirates"
  // ];
  // static List<String> testData1 = [];
  final TextEditingController _searchController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   testData1 = testData;
  //   _searchController.addListener(_performSearch);
  // }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Container(
              child: conditionalWidget(_selectedIndex),
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
    );
  }
}

Widget conditionalWidget(int numberToCheck) {
  switch (numberToCheck) {
    case 0:
      return Column(
        children: [
          const Text("zero widget"),
          Container(
            margin: const EdgeInsets.all(10),
            child: Banner(
              message: '20% off',
              location: BannerLocation.topEnd,
              color: Colors.green,
              child: Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                color: CustomColour.appTheme,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  height: 200,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Image.network(
                          "https://www.rachnasagar.in/rsarapp.services/assets/banners/1.png",
                          fit: BoxFit.fill,
                          width: 150,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Test book",
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white)),
                          SizedBox(height: 10),
                          Text("Description ....",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    case 1:
      return Column(
        children: [
          const Text("one widget"),
          Container(
            margin: const EdgeInsets.all(10),
            child: Banner(
              message: '20% off',
              location: BannerLocation.topEnd,
              color: Colors.green,
              child: Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                color: CustomColour.appTheme,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  height: 200,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Image.network(
                          "https://www.rachnasagar.in/rsarapp.services/assets/banners/1.png",
                          fit: BoxFit.fill,
                          width: 150,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Test book",
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white)),
                          SizedBox(height: 10),
                          Text("Description ....",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    case 2:
      return Column(
        children:  [
          const Text("two widget"),
          Column(
            children: [
              ListTile(
                tileColor: Colors.grey,
                  leading: Image.asset('assets/logo.png'),
                  iconColor: CustomColour.appTheme,
                  title: const Text(
                    'Update APP for better performance',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  )
              ),
            ],
          )
        ],
      );
    case 3:
      return Column(
        children: [
          const Text("three widget"),
          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset('assets/logo.png'),
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
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      child: const Text(' Hello , ',
                          style: TextStyle(fontSize: 20)),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      child: const Text(
                        ' Awnish kumar ',
                        style: TextStyle(
                            color: CustomColour.appTheme, fontSize: 20),
                      ),
                    ),
                  ],
                ),
                ListTile(
                  leading: const Icon(Icons.check_box_rounded),
                  iconColor: CustomColour.appTheme,
                  title: const Text(' Your Order '),
                  textColor: CustomColour.appTheme,
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.house_sharp),
                  iconColor: CustomColour.appTheme,
                  title: const Text(' Your Address '),
                  textColor: CustomColour.appTheme,
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.account_circle),
                  iconColor: CustomColour.appTheme,
                  title: const Text(' Your Profile '),
                  textColor: CustomColour.appTheme,
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.favorite),
                  iconColor: CustomColour.appTheme,
                  title: const Text(' Wishlist '),
                  textColor: CustomColour.appTheme,
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  iconColor: CustomColour.appTheme,
                  title: const Text('LogOut'),
                  textColor: CustomColour.appTheme,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      );
    default:
      return const Text("default widget");
  }
}
