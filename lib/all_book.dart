import 'package:flutter/material.dart';
import 'package:digi_text/product_detail.dart';
import 'package:digi_text/utility/CustomColour.dart';
import 'cart_page.dart';

class AllBook extends StatefulWidget {
  const AllBook({Key? key}) : super(key: key);

  @override
  State<AllBook> createState() => _AllBookState();
}

class _AllBookState extends State<AllBook> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: CustomColour.appTheme),
      darkTheme: ThemeData(brightness: Brightness.dark, primarySwatch: CustomColour.appTheme),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(backgroundColor: CustomColour.appTheme,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_sharp,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
          title: const Text('RACHNA SAGAR PVT. LTD',style: TextStyle(color: Colors.white,fontSize: 20),),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: ()  {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Cart()),
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.only(top: 3, left: 10, right: 10),
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
              Container(margin: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: InkWell(onTap: ()
                      {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) =>  ProductDetail()),
                        // );
                      },
                        child: Container(margin: const EdgeInsets.symmetric(horizontal: 3),
                          child: Card(elevation: 2,
                            child: Column(
                              children: [
                                Image.asset("assets/books.png"),
                                const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    'Together with cbse class-10 mathematics basic question bank study material exam 2023-24',
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(letterSpacing: 0.5,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(padding: const EdgeInsets.all(8),
                                  child: const Row(mainAxisAlignment: MainAxisAlignment.center,
                                      children:[
                                        Text(
                                          '\u{20B9} 425   ',
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(letterSpacing: 0.5,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          '\u{20B9} 500',
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(letterSpacing: 0.5,decoration: TextDecoration.lineThrough,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          ),textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          ' (15%)',
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(letterSpacing: 0.5,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold,
                                          ),textAlign: TextAlign.center,
                                        ),
                                      ]
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(onTap: ()
                      {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => ProductDetail()),
                        // );
                      },
                        child: Container(margin: const EdgeInsets.symmetric(horizontal: 3),
                          child: Card(elevation: 2,
                            child: Column(
                              children: [
                                Image.asset("assets/books.png"),
                                const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    'Together with cbse class-10 mathematics basic question bank study material exam 2023-24',
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(letterSpacing: 0.5,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(padding: const EdgeInsets.all(8),
                                  child: const Row(mainAxisAlignment: MainAxisAlignment.center,
                                      children:[
                                        Text(
                                          '\u{20B9} 360   ',
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(letterSpacing: 0.5,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          '\u{20B9} 400',
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(letterSpacing: 0.5,decoration: TextDecoration.lineThrough,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          ),textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          ' (10%)',
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(letterSpacing: 0.5,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold,
                                          ),textAlign: TextAlign.center,
                                        ),
                                      ]
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(margin: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(margin: const EdgeInsets.symmetric(horizontal: 3),
                        child: Card(elevation: 2,
                          child: Column(
                            children: [
                              Image.asset("assets/books.png"),
                              const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  'Together with cbse class-10 mathematics basic question bank study material exam 2023-24',
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(letterSpacing: 0.5,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),textAlign: TextAlign.center,
                                ),
                              ),
                              Container(padding: const EdgeInsets.all(8),
                                child: const Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children:[
                                      Text(
                                        '\u{20B9} 540   ',
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(letterSpacing: 0.5,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        '\u{20B9} 600',
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(letterSpacing: 0.5,decoration: TextDecoration.lineThrough,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        ' (10%)',
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(letterSpacing: 0.5,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold,
                                        ),textAlign: TextAlign.center,
                                      ),
                                    ]
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(margin: const EdgeInsets.symmetric(horizontal: 3),
                        child: Card(elevation: 2,
                          child: Column(
                            children: [
                              Image.asset("assets/books.png"),
                              const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  'Together with cbse class-10 mathematics basic question bank study material exam 2023-24',
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(letterSpacing: 0.5,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),textAlign: TextAlign.center,
                                ),
                              ),
                              Container(padding: const EdgeInsets.all(8),
                                child: const Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children:[
                                      Text(
                                        '\u{20B9} 450   ',
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(letterSpacing: 0.5,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        '\u{20B9} 500',
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(letterSpacing: 0.5,decoration: TextDecoration.lineThrough,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        ' (10%)',
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(letterSpacing: 0.5,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold,
                                        ),textAlign: TextAlign.center,
                                      ),
                                    ]
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(margin: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(margin: const EdgeInsets.symmetric(horizontal: 3),
                        child: Card(elevation: 2,
                          child: Column(
                            children: [
                              Image.asset("assets/books.png"),
                              const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  'Together with cbse class-10 mathematics basic question bank study material exam 2023-24',
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(letterSpacing: 0.5,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),textAlign: TextAlign.center,
                                ),
                              ),
                              Container(padding: const EdgeInsets.all(8),
                                child: const Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children:[
                                      Text(
                                        '\u{20B9} 425   ',
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(letterSpacing: 0.5,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        '\u{20B9} 500',
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(letterSpacing: 0.5,decoration: TextDecoration.lineThrough,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        ' (15%)',
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(letterSpacing: 0.5,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold,
                                        ),textAlign: TextAlign.center,
                                      ),
                                    ]
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(margin: const EdgeInsets.symmetric(horizontal: 3),
                        child: Card(elevation: 2,
                          child: Column(
                            children: [
                              Image.asset("assets/books.png"),
                              const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  'Together with cbse class-10 mathematics basic question bank study material exam 2023-24',
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(letterSpacing: 0.5,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),textAlign: TextAlign.center,
                                ),
                              ),
                              Container(padding: const EdgeInsets.all(8),
                                child: const Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children:[
                                      Text(
                                        '\u{20B9} 360   ',
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(letterSpacing: 0.5,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        '\u{20B9} 400',
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(letterSpacing: 0.5,decoration: TextDecoration.lineThrough,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        ' (10%)',
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(letterSpacing: 0.5,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold,
                                        ),textAlign: TextAlign.center,
                                      ),
                                    ]
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(margin: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(margin: const EdgeInsets.symmetric(horizontal: 3),
                        child: Card(elevation: 2,
                          child: Column(
                            children: [
                              Image.asset("assets/books.png"),
                              const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  'Together with cbse class-10 mathematics basic question bank study material exam 2023-24',
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(letterSpacing: 0.5,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),textAlign: TextAlign.center,
                                ),
                              ),
                              Container(padding: const EdgeInsets.all(8),
                                child: const Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children:[
                                      Text(
                                        '\u{20B9} 540   ',
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(letterSpacing: 0.5,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        '\u{20B9} 600',
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(letterSpacing: 0.5,decoration: TextDecoration.lineThrough,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        ' (10%)',
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(letterSpacing: 0.5,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold,
                                        ),textAlign: TextAlign.center,
                                      ),
                                    ]
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(margin: const EdgeInsets.symmetric(horizontal: 3),
                        child: Card(elevation: 2,
                          child: Column(
                            children: [
                              Image.asset("assets/books.png"),
                              const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  'Together with cbse class-10 mathematics basic question bank study material exam 2023-24',
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(letterSpacing: 0.5,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),textAlign: TextAlign.center,
                                ),
                              ),
                              Container(padding: const EdgeInsets.all(8),
                                child: const Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children:[
                                      Text(
                                        '\u{20B9} 450   ',
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(letterSpacing: 0.5,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        '\u{20B9} 500',
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(letterSpacing: 0.5,decoration: TextDecoration.lineThrough,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        ' (10%)',
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(letterSpacing: 0.5,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold,
                                        ),textAlign: TextAlign.center,
                                      ),
                                    ]
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}