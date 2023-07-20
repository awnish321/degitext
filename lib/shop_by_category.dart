import 'package:flutter/material.dart';
import 'package:new_flutter_project/product_detail.dart';
import 'package:new_flutter_project/utility/CustomColour.dart';

import 'cart_page.dart';

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

  String classDropDownValue = '';
  var classList = [
    'Select class',
    'Class 1',
    'Class 2',
    'Class 3',
    'Class 4',
    'Class 5',
  ];

  String booksTypeDropDownValue = '';
  var bookList = [
    'Types of Books',
    'Textbook',
    'Workbook',
    'Workbook cum practice material',
    'worksheets',
    'Trm',
  ];

  String subjectTypeDropDownValue = '';
  var subjectList = [
    'Select subject',
    'Hindi',
    'English',
    'Math',
    'S.S.T',
    'Science',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    classDropDownValue = classList[0];
    booksTypeDropDownValue = bookList[0];
    subjectTypeDropDownValue = subjectList[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: CustomColour.appTheme),
      darkTheme: ThemeData(brightness: Brightness.dark, primarySwatch: CustomColour.appTheme),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_sharp,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
          title: const Text('RACHNA SAGAR PVT. LTD'),
          centerTitle: true,
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
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: CustomColour.appTheme.shade800,
                    border: Border.all(
                        color: CustomColour.appTheme.shade800, // Set border color
                        width: 3.0), // Set border width
                    borderRadius: const BorderRadius.all(
                        Radius.circular(10.0)), // Set rounded corner radius
                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'CBSE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Card(
                  elevation: 1,
                  shadowColor: Colors.black,
                  color: Colors.grey[200],
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        DropdownButton(
                          isExpanded: true,
                          value: classDropDownValue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: classList.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              classDropDownValue = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal:  8),
                child: Card(
                  elevation: 1,
                  shadowColor: Colors.black,
                  color: Colors.grey[200],
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        DropdownButton(
                          isExpanded: true,
                          value: booksTypeDropDownValue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: bookList.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              booksTypeDropDownValue = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal:  8),
                child: Card(
                  elevation: 1,
                  shadowColor: Colors.black,
                  color: Colors.grey[200],
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        DropdownButton(
                          isExpanded: true,
                          value: subjectTypeDropDownValue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: subjectList.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              subjectTypeDropDownValue = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  ProductDetail()),
                        );
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
                                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                      children:const [
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProductDetail()),
                        );
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
                                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                      children:const [
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
                                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children:const [
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
                                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children:const [
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
                                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children:const [
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
                                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children:const [
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
                                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children:const [
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
                                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children:const [
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

