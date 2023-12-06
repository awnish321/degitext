import 'package:flutter/material.dart';
import 'package:new_flutter_project/all_book.dart';
import 'package:new_flutter_project/coming_soon_page.dart';
import 'package:new_flutter_project/contact_us.dart';
import 'package:new_flutter_project/download_zip_file.dart';
import 'package:new_flutter_project/login_page.dart';
import 'package:new_flutter_project/my_order.dart';
import 'package:new_flutter_project/pdf_open.dart';
import 'package:new_flutter_project/profile_page.dart';
import 'package:new_flutter_project/saved_address_page.dart';
import 'package:new_flutter_project/shop_by_category.dart';
import 'package:new_flutter_project/wishlist_page.dart';

import 'cart_page.dart';
import 'main.dart';
import 'utility/CustomColour.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  static const themeColour = Color(0xFFEA6865);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(backgroundColor: CustomColour.appTheme),
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
  static const cardTopColour = Color(0xFFEF5932);
  static const cardBottomColour = Color(0xFFF68802);
  static const card1TopColour = Color(0xFFE13EA0);
  static const card1BottomColour = Color(0xFFD8133A);
  static const notificationColour = Color(0xFFECE9E9);
  final pageController = PageController();
  final pageController1 = PageController();
  final pageController2 = PageController();

  double currentPage = 0;
  int _selectedIndex = 0;

  @override
  void initState() {
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.toDouble();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex == 0) {
          return true;
        }
        setState(() {
          _selectedIndex = 0;
        });
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColour.appTheme,
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            'RACHNA SAGAR PVT. LTD',
            style: TextStyle(color: Colors.white,fontSize: 20),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Cart()),
                );
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.black12,
            child: conditionalWidget(_selectedIndex, context),
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
                    style: TextStyle(fontSize: 18,),
                  ),
                  accountEmail: Text("Awnish@gmail.com"),
                  currentAccountPictureSize: Size.square(45),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      "A",
                      style: TextStyle(
                          fontSize: 25.0, color: CustomColour.appTheme),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyProfile()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.book),
                iconColor: CustomColour.appTheme,
                title: const Text(' My Order '),
                textColor: CustomColour.appTheme,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MyOrder()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.account_balance_sharp),
                iconColor: CustomColour.appTheme,
                title: const Text(' My Address '),
                textColor: CustomColour.appTheme,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SavedAddress()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.favorite),
                iconColor: CustomColour.appTheme,
                title: const Text(' WishList '),
                textColor: CustomColour.appTheme,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WishList()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.shopping_cart),
                iconColor: CustomColour.appTheme,
                title: const Text(' My Cart '),
                textColor: CustomColour.appTheme,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Cart()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.quick_contacts_dialer_outlined),
                iconColor: CustomColour.appTheme,
                title: const Text(' Contact Us '),
                textColor: CustomColour.appTheme,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ContactUs()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                iconColor: CustomColour.appTheme,
                title: const Text('LogOut'),
                textColor: CustomColour.appTheme,
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) =>  const LoginPage()));
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

Widget conditionalWidget(int numberToCheck, BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;

  final pageController = PageController();
  final pageController1 = PageController();
  final pageController2 = PageController();
  double currentPage = 0;

  switch (numberToCheck) {
    case 0:
      return SizedBox(
          width: width,
          height: height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                flex: 0,
                child: Container(
                  width: double.infinity,
                  height: 55,
                  margin: const EdgeInsets.only(bottom: 10, top: 3),
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
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 150,
                  child: PageView(
                    controller: pageController,
                    scrollDirection: Axis.horizontal,
                    children: [
                      InkWell(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                "https://www.rachnasagar.in/assets/banners/634e33a7a654ffree-shipping.jpg",
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ShopByCategory()),
                          );
                        },
                      ),
                      InkWell(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                "https://www.rachnasagar.in/assets/banners/655ddc700cb50CBSE%20QB+PYQ+EAD%20Website%20Banner.webp",
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ShopByCategory()),
                          );
                        },
                      ),
                      InkWell(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                "https://www.rachnasagar.in/assets/banners/649eacffc9e27Updated-ICSE-2023-24-Banner-22.06.2023-Final.webp",
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ShopByCategory()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 5),
                        alignment: Alignment.centerLeft,
                        height: 9,
                        width: 9,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentPage == index
                              ? DashBoard.themeColour
                              : Colors.black26,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 150,
                  width: double.infinity,
                  color: Colors.black,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.symmetric(horizontal: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 2),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                          ),
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShopByCategory()),
                              );
                            },
                            child: const Text("Student/Parent",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 2),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                          ),
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShopByCategory()),
                              );
                            },
                            child: const Text("Teacher/Schools",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 2),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                          ),
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShopByCategory()),
                              );
                            },
                            child: const Text("Bookseller",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "New Release",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AllBook()),
                            );
                          },
                          child: const Text(
                            "View All",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                          )),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 150,
                  child: PageView(
                    controller: pageController1,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              "https://www.rachnasagar.in/assets/banners/655ddc700cb50CBSE%20QB+PYQ+EAD%20Website%20Banner.webp",
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              "https://www.rachnasagar.in/assets/banners/649eacffc9e27Updated-ICSE-2023-24-Banner-22.06.2023-Final.webp",
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              "https://www.rachnasagar.in/assets/banners/634e33a7a654ffree-shipping.jpg",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Shop By Category",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ShopByCategory()),
                            );
                          },
                          child: const Text(
                            "View All",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                          )),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 150,
                  child: PageView(
                    controller: pageController2,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              "https://www.rachnasagar.in/assets/banners/649eacffc9e27Updated-ICSE-2023-24-Banner-22.06.2023-Final.webp",
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              "https://www.rachnasagar.in/assets/banners/634e33a7a654ffree-shipping.jpg",
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              "https://www.rachnasagar.in/assets/banners/655ddc700cb50CBSE%20QB+PYQ+EAD%20Website%20Banner.webp",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
      );
    case 1:
      return Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  _MyHomePageState.cardTopColour,
                  _MyHomePageState.cardBottomColour,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            margin: const EdgeInsets.all(10),
            child: InkWell(
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('E-Book',
                      style: TextStyle(
                          color: Colors.white, fontSize: 20, height: 1)),
                  Text('Tap to download and read e-book',
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                ],
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const OpenPdf()));
              },
            ),
          ),
          Container(
            width: double.infinity,
            height: 150,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  _MyHomePageState.card1TopColour,
                  _MyHomePageState.card1BottomColour,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            margin: const EdgeInsets.all(10),
            child: InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Interactive E-Book',
                      style: TextStyle(
                          color: Colors.white, fontSize: 20, height: 1)),
                  Text('Tap to download and read interactive e-book',
                      style: TextStyle(color: Colors.white, fontSize: 15))
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ComingSoon()));
              },
            ),
          ),
        ],
      );
    case 2:
      return Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DownloadAssetsDemo()));
            },
            child: Container(
              margin: const EdgeInsets.only(top: 10, bottom: 5),
              child: ListTile(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    side: BorderSide(width: 2, color: CustomColour.appTheme)),
                tileColor: _MyHomePageState.notificationColour,
                minVerticalPadding: 5,
                // tileColor: CupertinoColors.systemGrey,
                leading: Image.asset(
                  'assets/logo.png',
                  width: 30,
                  height: 30,
                ),
                // iconColor: Colors.grey,
                title: const Text(
                  'Happy Holi 2023: Wishes, Messages and Quotes',
                  style: TextStyle(
                    decorationStyle: TextDecorationStyle.solid,
                    color: Colors.black54,
                    decorationThickness: 3,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    // decoration: TextDecoration.underline
                  ),
                ),
                subtitle: Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: const Text(
                          'Best wishes to you and your family for a Holi filled with sweet moments and memories to cherish for long. Happy Holi my dear',
                          style: TextStyle(color: Colors.black54),
                          textAlign: TextAlign.justify,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          'assets/icon.png',
                          width: 20,
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            '1 june',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              decorationStyle: TextDecorationStyle.solid,
                              color: Colors.black54,
                              decorationThickness: 3,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: ListTile(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  side: BorderSide(width: 2, color: CustomColour.appTheme)),
              tileColor: _MyHomePageState.notificationColour,
              minVerticalPadding: 5,
              // tileColor: CupertinoColors.systemGrey,
              leading: Image.asset(
                'assets/logo.png',
                width: 30,
                height: 30,
              ),
              // iconColor: Colors.grey,
              title: const Text(
                'Enhance your banner with captivating imagery',
                style: TextStyle(
                  decorationStyle: TextDecorationStyle.solid,
                  color: Colors.black54,
                  decorationThickness: 3,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  // decoration: TextDecoration.underline
                ),
              ),
              subtitle: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: const Text(
                        'As the old saying goes, a picture is worth a thousand words. Save space on your design and communicate a powerful message with a strong photo. This example is a case in point of how a good photo choice can make all the difference. Upload your own photo or explore our library of stock photos.',
                        style: TextStyle(color: Colors.black54),
                        textAlign: TextAlign.justify,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        width: 20,
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          '28 may',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            decorationStyle: TextDecorationStyle.solid,
                            color: Colors.black54,
                            decorationThickness: 3,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: ListTile(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  side: BorderSide(width: 2, color: CustomColour.appTheme)),
              tileColor: _MyHomePageState.notificationColour,
              minVerticalPadding: 5,
              // tileColor: CupertinoColors.systemGrey,
              leading: Image.asset(
                'assets/icon.png',
                width: 30,
                height: 30,
              ),
              // iconColor: Colors.grey,
              title: const Text(
                'Update APP ',
                style: TextStyle(
                  decorationStyle: TextDecorationStyle.solid,
                  color: Colors.black54,
                  decorationThickness: 3,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  // decoration: TextDecoration.underline
                ),
              ),
              subtitle: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: const Text(
                        'For better performance please update your app For better performance please update your app',
                        style: TextStyle(color: Colors.black54),
                        textAlign: TextAlign.justify,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        width: 20,
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          '12 may',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            decorationStyle: TextDecorationStyle.solid,
                            color: Colors.black54,
                            decorationThickness: 3,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 5),
            child: ListTile(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  side: BorderSide(width: 2, color: CustomColour.appTheme)),
              tileColor: _MyHomePageState.notificationColour,
              minVerticalPadding: 5,
              // tileColor: CupertinoColors.systemGrey,
              leading: Image.asset(
                'assets/logo.png',
                width: 30,
                height: 30,
              ),
              // iconColor: Colors.grey,
              title: const Text(
                'Happy Holi 2023: Wishes, Messages and Quotes',
                style: TextStyle(
                  decorationStyle: TextDecorationStyle.solid,
                  color: Colors.black54,
                  decorationThickness: 3,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  // decoration: TextDecoration.underline
                ),
              ),
              subtitle: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: const Text(
                        'Best wishes to you and your family for a Holi filled with sweet moments and memories to cherish for long. Happy Holi my dear',
                        style: TextStyle(color: Colors.black54),
                        textAlign: TextAlign.justify,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/icon.png',
                        width: 20,
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          '1 june',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            decorationStyle: TextDecorationStyle.solid,
                            color: Colors.black54,
                            decorationThickness: 3,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: ListTile(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  side: BorderSide(width: 2, color: CustomColour.appTheme)),
              tileColor: _MyHomePageState.notificationColour,
              minVerticalPadding: 5,
              // tileColor: CupertinoColors.systemGrey,
              leading: Image.asset(
                'assets/logo.png',
                width: 30,
                height: 30,
              ),
              // iconColor: Colors.grey,
              title: const Text(
                'Enhance your banner with captivating imagery',
                style: TextStyle(
                  decorationStyle: TextDecorationStyle.solid,
                  color: Colors.black54,
                  decorationThickness: 3,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  // decoration: TextDecoration.underline
                ),
              ),
              subtitle: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: const Text(
                        'As the old saying goes, a picture is worth a thousand words. Save space on your design and communicate a powerful message with a strong photo. This example is a case in point of how a good photo choice can make all the difference. Upload your own photo or explore our library of stock photos.',
                        style: TextStyle(color: Colors.black54),
                        textAlign: TextAlign.justify,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        width: 20,
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          '28 may',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            decorationStyle: TextDecorationStyle.solid,
                            color: Colors.black54,
                            decorationThickness: 3,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: ListTile(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  side: BorderSide(width: 2, color: CustomColour.appTheme)),
              tileColor: _MyHomePageState.notificationColour,
              minVerticalPadding: 5,
              // tileColor: CupertinoColors.systemGrey,
              leading: Image.asset(
                'assets/icon.png',
                width: 30,
                height: 30,
              ),
              // iconColor: Colors.grey,
              title: const Text(
                'Update APP ',
                style: TextStyle(
                  decorationStyle: TextDecorationStyle.solid,
                  color: Colors.black54,
                  decorationThickness: 3,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  // decoration: TextDecoration.underline
                ),
              ),
              subtitle: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: const Text(
                        'For better performance please update your app For better performance please update your app',
                        style: TextStyle(color: Colors.black54),
                        textAlign: TextAlign.justify,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        width: 20,
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          '12 may',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            decorationStyle: TextDecorationStyle.solid,
                            color: Colors.black54,
                            decorationThickness: 3,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      );
    case 3:
      return Column(
        children: [
          const Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: CustomColour.appTheme,
                    minRadius: 65.0,
                    child: CircleAvatar(
                      radius: 60.0,
                      backgroundImage: NetworkImage(
                          'https://www.rachnasagar.in/assets/img/noImage.png'),
                    ),
                  ),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Container(
              //       margin: const EdgeInsets.symmetric(vertical: 15),
              //       child: const Text(' Hello , ',
              //           style: TextStyle(fontSize: 20,color: Colors.black45,fontWeight: FontWeight.bold)),
              //     ),
              //     Container(
              //       margin: const EdgeInsets.symmetric(vertical: 15),
              //       child: const Text(
              //         ' Awnish kumar ',
              //         style: TextStyle(
              //             color: CustomColour.appTheme, fontSize: 20,fontWeight: FontWeight.bold),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          ListTile(
            minLeadingWidth: 0,
            leading: const Icon(Icons.account_circle),
            iconColor: CustomColour.appTheme,
            title: const Text(' My Profile ',
                style: TextStyle(fontWeight: FontWeight.bold)),
            textColor: Colors.black45,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyProfile()));
            },
          ),
          const Divider(thickness: 1.2, height: 0),
          ListTile(
            minLeadingWidth: 0,
            leading: const Icon(Icons.house_sharp),
            iconColor: CustomColour.appTheme,
            title: const Text(' My Address ',
                style: TextStyle(fontWeight: FontWeight.bold)),
            textColor: Colors.black45,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SavedAddress()));
            },
          ),
          const Divider(thickness: 1.2, height: 0),
          ListTile(
            minLeadingWidth: 0,
            leading: const Icon(Icons.check_box_rounded),
            iconColor: CustomColour.appTheme,
            title: const Text(' My Order ',
                style: TextStyle(fontWeight: FontWeight.bold)),
            textColor: Colors.black45,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyOrder()));
            },
          ),
          const Divider(thickness: 1.2, height: 0),
          ListTile(
            minLeadingWidth: 0,
            leading: const Icon(Icons.shopping_cart),
            iconColor: CustomColour.appTheme,
            title: const Text(' My cart ',
                style: TextStyle(fontWeight: FontWeight.bold)),
            textColor: Colors.black45,
            onTap: () {
              // Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Cart()));
            },
          ),
          const Divider(thickness: 1.2, height: 0),
          ListTile(
            minLeadingWidth: 0,
            leading: const Icon(Icons.favorite),
            iconColor: CustomColour.appTheme,
            title: const Text(' Wishlist ',
                style: TextStyle(fontWeight: FontWeight.bold)),
            textColor: Colors.black45,
            onTap: () {
              // Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const WishList()));
            },
          ),
          const Divider(thickness: 1.2, height: 0),
          ListTile(
            minLeadingWidth: 0,
            leading: const Icon(Icons.logout),
            iconColor: CustomColour.appTheme,
            title: const Text('LogOut',
                style: TextStyle(fontWeight: FontWeight.bold)),
            textColor: Colors.black45,
            onTap: () {
              // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
              //   return const MyApp();
              // }), (r){
              //   return false;
              // });
              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context){
              //   return const MyApp();
              // }));
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
            },
          ),
          const Divider(thickness: 1.2, height: 0),
        ],
      );
    default:
      return const Text("default widget");
  }
}
