import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:new_flutter_project/all_book.dart';
import 'package:new_flutter_project/bookseller_list.dart';
import 'package:new_flutter_project/coming_soon_page.dart';
import 'package:new_flutter_project/contact_us.dart';
import 'package:new_flutter_project/demo1.dart';
import 'package:new_flutter_project/download_zip_file.dart';
import 'package:new_flutter_project/login_page.dart';
import 'package:new_flutter_project/my_order.dart';
import 'package:new_flutter_project/pdf_open.dart';
import 'package:new_flutter_project/profile_page.dart';
import 'package:new_flutter_project/saved_address_page.dart';
import 'package:new_flutter_project/shop_by_category.dart';
import 'package:new_flutter_project/wishlist_page.dart';
import 'cart_page.dart';
import 'demo.dart';
import 'model/Book.dart';
import 'utility/CustomColour.dart';
import 'model/AllBookListModel.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart%20';
import 'package:fluttertoast/fluttertoast.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key,});

  @override
  State<DashBoard> createState() => _DashBoardState();
  static const themeColour = Color(0xFFEA6865);
}

class _DashBoardState extends State<DashBoard> {
  static const cardTopColour = Color(0xFFEF5932);
  static const cardBottomColour = Color(0xFFF68802);
  static const card1TopColour = Color(0xFFE13EA0);
  static const card1BottomColour = Color(0xFFD8133A);
  static const notificationColour = Color(0xFFF8F8F8);
  late int _currentIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const EbookScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return
        WillPopScope(
      onWillPop: () async {
        if (_selectedIndex == 0) {
          setState(() {
            _selectedIndex = 0;
          });
          return true;
        }else{
          return false;
        }
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
            child: _screens[_currentIndex],
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
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}
class _HomeScreenState extends State<HomeScreen> {

  int selectedIndex = 0;
  int currentPage = 0;
  late Timer timer;
  final pageController1 = PageController();
  final pageController2 = PageController();
  final PageController pageController = PageController(
    initialPage: 0,
  );
  var images=[
    'https://www.rachnasagar.in/assets/banners/634e33a7a654ffree-shipping.jpg',
    'https://www.rachnasagar.in/assets/banners/655ddc700cb50CBSE%20QB+PYQ+EAD%20Website%20Banner.webp',
    'https://www.rachnasagar.in/assets/banners/649eacffc9e27Updated-ICSE-2023-24-Banner-22.06.2023-Final.webp',
  ];
  List<Book> originalData=[];
  List<Book> searchData=[];
  final bool isLoading = true; // Change this to see the different results

  @override
  void initState() {
    fetchBooksData();
    timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (currentPage < 2) {
        currentPage++;
        setState(() {
          selectedIndex = currentPage;
        });

      } else {
        currentPage = 0;
        setState(() {
          selectedIndex = currentPage;
        });
      }
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  Future<List<Book>> fetchBooksData() async {
    final registerData = jsonEncode({"action": 'allBooks'});
    Map<String, String> headers = {
      'rsplkey': 'rspl',
      'Content-Type': 'application/json'
    };
    Response response = await http.post(
      Uri.parse('https://www.rachnasagar.in/digitextapp/api/booksList'),
      headers: headers,
      body: registerData,
    );
    if (response.statusCode == 200) {
      originalData= parseBooks(response.body);
      return parseBooks(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  void dataSearch(String value) async {
    List<Book>? data = [];
    if (value.isEmpty) {
      setState(() {
        originalData = searchData;
      });
      return;
    }
    originalData = searchData;
    for (var i = 0; i < originalData.length; i++) {
      if(originalData[i].productTitle.toLowerCase().contains(value.toLowerCase())){
        data.add(originalData[i]);
      }
    }
    setState(() {
      originalData = data;
    });
  }

  void searchProduct(String query) {

    if(query.isNotEmpty){
      searchData.clear();
      for (var i = 0; i < originalData.length; i++) {
        if(originalData[i].productTitle.toLowerCase().contains(query.toLowerCase())){
          searchData.add(originalData[i]);
        }
      setState(() {
        searchData;
      });
      }
    }else{
      setState(() {
        searchData.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context)
  {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
        width: width,
        child: Column(
          children: <Widget>[
            // Column(
            //   children: [
            //     TextField(
            //       decoration: InputDecoration(
            //         filled: true,
            //         fillColor: const Color(0xffc9c1c1),
            //         border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(10),
            //           borderSide: BorderSide.none,
            //         ),
            //         hintText: "Search for Items",
            //         prefixIcon: const Icon(Icons.search),
            //         prefixIconColor: Colors.black,
            //       ),
            //       onChanged: (string) {
            //         searchProduct(string);
            //
            //         // searchData.clear();
            //         //   setState(() {
            //         //     for (var i = 0; i < originalData.length; i++) {
            //         //       if(originalData[i].productTitle.toLowerCase().contains(string.toLowerCase())){
            //         //         searchData.add(originalData[i]);
            //         //       }
            //         //     }
            //         //     // searchData = originalData.where((u) => (u.productTitle.toLowerCase().contains(string.toLowerCase(),)),).toList();
            //         // });
            //       },
            //     ),
            //   ],
            // ),
            Column(
              children: [
                SizedBox (height: 170,
                    child: PageView(
                      controller: pageController,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage(images[0]),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage(images[1]),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage(images[2]),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3, (selectedIndex) {
                      return Container(
                        margin: const EdgeInsets.only(right: 5),
                        alignment: Alignment.centerLeft,
                        height: 9,
                        width: 9,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentPage == selectedIndex ? DashBoard.themeColour : Colors.black26,
                        ),
                      );
                    },
                    ),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Container(
                    height: 180,
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
                                      const Demo1()),
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
                                      builder: (context) => const BookSellerList()),
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
                                    builder: (context) => const Demo()),
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
                  flex: 0,
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
                  flex: 0,
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
            ),
          ],
        )
    );
  }

}
class EbookScreen extends StatelessWidget {
  const EbookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 150,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                _DashBoardState.cardTopColour,
                _DashBoardState.cardBottomColour,
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
                _DashBoardState.card1TopColour,
                _DashBoardState.card1BottomColour,
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
  }
}
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              tileColor: _DashBoardState.notificationColour,
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
            tileColor: _DashBoardState.notificationColour,
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
            tileColor: _DashBoardState.notificationColour,
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
            tileColor: _DashBoardState.notificationColour,
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
            tileColor: _DashBoardState.notificationColour,
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
            tileColor: _DashBoardState.notificationColour,
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
  }
}
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
  }
}
