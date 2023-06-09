import 'package:flutter/material.dart';
import 'package:new_flutter_project/shop_by_category.dart';
import 'web_page.dart';
import 'utility/CustomColour.dart';

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
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
        child: SingleChildScrollView(
          child: Container(
            child: conditionalWidget(_selectedIndex,context),
          ),
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
        selectedIconTheme: const IconThemeData(color: CustomColour.appTheme, size: 40),
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

Widget conditionalWidget(int numberToCheck, BuildContext context) {
  double height = MediaQuery. of(context). size. height;
  double width = MediaQuery. of(context). size. width ;

  final pageController = PageController();
  final pageController1 = PageController();
  final pageController2 = PageController();
  const double currentPage = 0;

  switch (numberToCheck)
  {
    case 0:
      return SizedBox(width: width,height: height,
          child: Column(mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(flex: 0,
                child: Container( width: double.infinity,height: 55,margin: const EdgeInsets.only(bottom: 10,top: 3),
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
              Expanded(flex: 1,
                child: SizedBox(
                  height: 150,
                  child: PageView(
                    controller: pageController,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://images.unsplash.com/photo-1607355739828-0bf365440db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1444&q=80",
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
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
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
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://images.unsplash.com/photo-1584810359583-96fc3448beaa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(mainAxisSize: MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 5),
                      alignment: Alignment.centerLeft,
                      height: 9,
                      width: 9,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentPage == index
                            ? Colors.black
                            : Colors.black12,
                      ),
                    );
                  },
                  ),
                ),
              ),
              Expanded(flex: 1,
                child: Container(height: 150,width: double.infinity,color: Colors.black,alignment: Alignment.center,padding: const EdgeInsets.all(15),margin: const EdgeInsets.symmetric(horizontal: 0),
                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(flex :1,
                        child: Container(margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 2),alignment: Alignment.center,
                          decoration: BoxDecoration(border: Border.all(color: Colors.white,),),width: double.infinity,
                          child: TextButton(onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ShopByCategory()),
                            );
                          },
                            child: const Text("Student/Parent",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold,)),),
                        ),
                      ),
                      Expanded(flex :1,
                        child: Container(margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 2),alignment: Alignment.center,
                          decoration: BoxDecoration(border: Border.all(color: Colors.white,),),width: double.infinity,
                          child: TextButton(onPressed: () {  },
                            child: const Text("Teacher/Schools",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold,)),),
                        ),
                      ),
                      Expanded(flex :1,
                        child: Container(margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 2),alignment: Alignment.center,
                          decoration: BoxDecoration(border: Border.all(color: Colors.white,),),width: double.infinity,
                          child: TextButton(onPressed: () {  },
                            child: const Text("Bookseller",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold,)),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Expanded(flex: 0,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("New Release",textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),),
                ),
              ),
              Expanded(flex: 1,
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
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://images.unsplash.com/photo-1607355739828-0bf365440db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1444&q=80",
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
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
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
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://images.unsplash.com/photo-1584810359583-96fc3448beaa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Expanded(flex: 0,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("Shop By Category",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),),
                ),
              ),
              Expanded(flex: 1,
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
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://images.unsplash.com/photo-1607355739828-0bf365440db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1444&q=80",
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
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
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
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://images.unsplash.com/photo-1584810359583-96fc3448beaa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
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
        children:  [
          Container(width: double.infinity,height: 150, decoration: const BoxDecoration(
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
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('E-Book',style: TextStyle(color: Colors.white,fontSize: 20,height: 1)),
                Text('Tap to download and read e-book',style: TextStyle(color: Colors.white,fontSize: 15)),
              ],
            ),
          ),
          Container(width: double.infinity,height: 150, decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                _MyHomePageState.card1TopColour,
                _MyHomePageState.card1BottomColour,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),margin: const EdgeInsets.all(10),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Interactive E-Book',style: TextStyle(color: Colors.white,fontSize: 20,height: 1)),
                Text('Tap to download and read interactive e-book',style: TextStyle(color: Colors.white,fontSize: 15))
              ],
            ),
          ),
        ],
      );
    case 2:
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10,bottom: 5),
            child: ListTile(shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),side: BorderSide(width: 2,color: CustomColour.appTheme)),tileColor: _MyHomePageState.notificationColour,minVerticalPadding: 5,
              // tileColor: CupertinoColors.systemGrey,
              leading: Image.asset('assets/logo.png',width: 30,height: 30,),
              // iconColor: Colors.grey,
              title: const Text('Happy Holi 2023: Wishes, Messages and Quotes',
                style: TextStyle(decorationStyle: TextDecorationStyle.solid,color: Colors.black54,decorationThickness: 3,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  // decoration: TextDecoration.underline
                ),
              ),
              subtitle: Column(
                children: [
                  Container(margin: const EdgeInsets.symmetric(vertical: 5),
                      child: const Text('Best wishes to you and your family for a Holi filled with sweet moments and memories to cherish for long. Happy Holi my dear',style: TextStyle(color: Colors.black54),textAlign: TextAlign.justify,)),
                  Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset('assets/icon.png',width: 20,height: 20,),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('1 june',textAlign: TextAlign.center,
                          style: TextStyle(decorationStyle: TextDecorationStyle.solid,color: Colors.black54,decorationThickness: 3,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(margin: const EdgeInsets.symmetric(vertical: 5),
            child: ListTile(shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),side: BorderSide(width: 2,color: CustomColour.appTheme)),tileColor: _MyHomePageState.notificationColour,minVerticalPadding: 5,
              // tileColor: CupertinoColors.systemGrey,
              leading: Image.asset('assets/logo.png',width: 30,height: 30,),
              // iconColor: Colors.grey,
              title: const Text('Enhance your banner with captivating imagery',
                style: TextStyle(decorationStyle: TextDecorationStyle.solid,color: Colors.black54,decorationThickness: 3,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  // decoration: TextDecoration.underline
                ),
              ),
              subtitle: Column(
                children: [
                  Container(margin: const EdgeInsets.symmetric(vertical: 5),
                      child: const Text('As the old saying goes, a picture is worth a thousand words. Save space on your design and communicate a powerful message with a strong photo. This example is a case in point of how a good photo choice can make all the difference. Upload your own photo or explore our library of stock photos.',style: TextStyle(color: Colors.black54),textAlign: TextAlign.justify,)),
                  Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset('assets/logo.png',width: 20,height: 20,),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('28 may',textAlign: TextAlign.center,
                          style: TextStyle(decorationStyle: TextDecorationStyle.solid,color: Colors.black54,decorationThickness: 3,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,),
                        ),
                      ),
                    ],
                  )
                ],

              ),
            ),
          ),
          Container(margin: const EdgeInsets.symmetric(vertical: 5),
            child: ListTile(shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),side: BorderSide(width: 2,color: CustomColour.appTheme)),tileColor: _MyHomePageState.notificationColour,minVerticalPadding: 5,
              // tileColor: CupertinoColors.systemGrey,
              leading: Image.asset('assets/icon.png',width: 30,height: 30,),
              // iconColor: Colors.grey,
              title: const Text('Update APP ',
                style: TextStyle(decorationStyle: TextDecorationStyle.solid,color: Colors.black54,decorationThickness: 3,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  // decoration: TextDecoration.underline
                ),
              ),
              subtitle: Column(
                children: [
                  Container(margin: const EdgeInsets.symmetric(vertical: 5),
                      child: const Text('For better performance please update your app For better performance please update your app',style: TextStyle(color: Colors.black54),textAlign: TextAlign.justify,)),
                  Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset('assets/logo.png',width: 20,height: 20,),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('12 may',textAlign: TextAlign.center,
                          style: TextStyle(decorationStyle: TextDecorationStyle.solid,color: Colors.black54,decorationThickness: 3,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10,bottom: 5),
            child: ListTile(shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),side: BorderSide(width: 2,color: CustomColour.appTheme)),tileColor: _MyHomePageState.notificationColour,minVerticalPadding: 5,
              // tileColor: CupertinoColors.systemGrey,
              leading: Image.asset('assets/logo.png',width: 30,height: 30,),
              // iconColor: Colors.grey,
              title: const Text('Happy Holi 2023: Wishes, Messages and Quotes',
                style: TextStyle(decorationStyle: TextDecorationStyle.solid,color: Colors.black54,decorationThickness: 3,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  // decoration: TextDecoration.underline
                ),
              ),
              subtitle: Column(
                children: [
                  Container(margin: const EdgeInsets.symmetric(vertical: 5),
                      child: const Text('Best wishes to you and your family for a Holi filled with sweet moments and memories to cherish for long. Happy Holi my dear',style: TextStyle(color: Colors.black54),textAlign: TextAlign.justify,)),
                  Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset('assets/icon.png',width: 20,height: 20,),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('1 june',textAlign: TextAlign.center,
                          style: TextStyle(decorationStyle: TextDecorationStyle.solid,color: Colors.black54,decorationThickness: 3,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(margin: const EdgeInsets.symmetric(vertical: 5),
            child: ListTile(shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),side: BorderSide(width: 2,color: CustomColour.appTheme)),tileColor: _MyHomePageState.notificationColour,minVerticalPadding: 5,
              // tileColor: CupertinoColors.systemGrey,
              leading: Image.asset('assets/logo.png',width: 30,height: 30,),
              // iconColor: Colors.grey,
              title: const Text('Enhance your banner with captivating imagery',
                style: TextStyle(decorationStyle: TextDecorationStyle.solid,color: Colors.black54,decorationThickness: 3,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  // decoration: TextDecoration.underline
                ),
              ),
              subtitle: Column(
                children: [
                  Container(margin: const EdgeInsets.symmetric(vertical: 5),
                      child: const Text('As the old saying goes, a picture is worth a thousand words. Save space on your design and communicate a powerful message with a strong photo. This example is a case in point of how a good photo choice can make all the difference. Upload your own photo or explore our library of stock photos.',style: TextStyle(color: Colors.black54),textAlign: TextAlign.justify,)),
                  Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset('assets/logo.png',width: 20,height: 20,),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('28 may',textAlign: TextAlign.center,
                          style: TextStyle(decorationStyle: TextDecorationStyle.solid,color: Colors.black54,decorationThickness: 3,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,),
                        ),
                      ),
                    ],
                  )
                ],

              ),
            ),
          ),
          Container(margin: const EdgeInsets.symmetric(vertical: 5),
            child: ListTile(shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),side: BorderSide(width: 2,color: CustomColour.appTheme)),tileColor: _MyHomePageState.notificationColour,minVerticalPadding: 5,
              // tileColor: CupertinoColors.systemGrey,
              leading: Image.asset('assets/icon.png',width: 30,height: 30,),
              // iconColor: Colors.grey,
              title: const Text('Update APP ',
                style: TextStyle(decorationStyle: TextDecorationStyle.solid,color: Colors.black54,decorationThickness: 3,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  // decoration: TextDecoration.underline
                ),
              ),
              subtitle: Column(
                children: [
                  Container(margin: const EdgeInsets.symmetric(vertical: 5),
                      child: const Text('For better performance please update your app For better performance please update your app',style: TextStyle(color: Colors.black54),textAlign: TextAlign.justify,)),
                  Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset('assets/logo.png',width: 20,height: 20,),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('12 may',textAlign: TextAlign.center,
                          style: TextStyle(decorationStyle: TextDecorationStyle.solid,color: Colors.black54,decorationThickness: 3,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,),
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
          Stack(
            children: [
              SizedBox(
                width: 100,
                height: 100,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                child: const Text(' Hello , ',
                    style: TextStyle(fontSize: 20,color: Colors.black45,fontWeight: FontWeight.bold)),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                child: const Text(
                  ' Awnish kumar ',
                  style: TextStyle(
                      color: CustomColour.appTheme, fontSize: 20,fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          ListTile(
            minLeadingWidth: 0,
            leading: const Icon(Icons.shopping_cart),
            iconColor: CustomColour.appTheme,
            title: const Text(' My cart ',style: TextStyle(fontWeight: FontWeight.bold)),
            textColor: Colors.black45,
            onTap: () {},
          ),
          const Divider(thickness: 1.2,height: 0),
          ListTile(
            minLeadingWidth: 0,
            leading: const Icon(Icons.check_box_rounded),
            iconColor: CustomColour.appTheme,
            title: const Text(' My Order ',style: TextStyle(fontWeight: FontWeight.bold)),
            textColor: Colors.black45,
            onTap: () {},
          ),
          const Divider(thickness: 1.2,height: 0),
          ListTile(
            minLeadingWidth: 0,
            leading: const Icon(Icons.house_sharp),
            iconColor: CustomColour.appTheme,
            title: const Text(' My Address ',style: TextStyle(fontWeight: FontWeight.bold)),
            textColor: Colors.black45,
            onTap: () {},
          ),
          const Divider(thickness: 1.2,height: 0),
          ListTile(
            minLeadingWidth: 0,
            leading: const Icon(Icons.account_circle),
            iconColor: CustomColour.appTheme,
            title: const Text(' My Profile ',style: TextStyle(fontWeight: FontWeight.bold)),
            textColor: Colors.black45,
            onTap: () {},
          ),
          const Divider(thickness: 1.2,height: 0),
          ListTile(
            minLeadingWidth: 0,
            leading: const Icon(Icons.favorite),
            iconColor: CustomColour.appTheme,
            title: const Text(' Wishlist ',style: TextStyle(fontWeight: FontWeight.bold)),
            textColor: Colors.black45,
            onTap: () {},
          ),
          const Divider(thickness: 1.2,height: 0),
          ListTile(
            minLeadingWidth: 0,
            leading: const Icon(Icons.logout),
            iconColor: CustomColour.appTheme,
            title: const Text('LogOut',style: TextStyle(fontWeight: FontWeight.bold)),
            textColor: Colors.black45,
            onTap: () {},
          ),
          const Divider(thickness: 1.2,height: 0),
        ],
      );
    default:
      return const Text("default widget");
  }
}
