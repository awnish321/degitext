import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_flutter_project/utility/CustomColour.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  State<WishList> createState() => _MyFavorite();
}

class _MyFavorite extends State<WishList> {
  static const notificationColour = Color(0xFFD7D7D7);

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String radioButtonItem = 'Student';
  int id = 1;

  List<Item> products = [
    Item(
        name: 'Apple',
        unit: 'Kg',
        price: 20,
        image: 'assets/logo.png'),
    Item(
        name: 'Mango',
        unit: 'Doz',
        price: 30,
        image: 'assets/images/mango.png'),
    Item(
        name: 'Banana',
        unit: 'Doz',
        price: 10,
        image: 'assets/images/banana.png'),
    Item(
        name: 'Grapes',
        unit: 'Kg',
        price: 8,
        image: 'assets/images/grapes.png'),
    Item(
        name: 'Water Melon',
        unit: 'Kg',
        price: 25,
        image: 'assets/images/watermelon.png'),
    Item(
        name: 'Kiwi',
        unit: 'Pc',
        price: 40,
        image: 'assets/images/kiwi.png'),
    Item(
        name: 'Orange',
        unit: 'Doz',
        price: 15,
        image: 'assets/images/orange.png'),
    Item(
        name: 'Peach',
        unit: 'Pc',
        price: 8,
        image: 'assets/images/peach.png'),
    Item(
        name: 'Strawberry',
        unit: 'Box',
        price: 12,
        image: 'assets/images/strawberry.png'),
    Item(
        name: 'Fruit Basket',
        unit: 'Kg',
        price: 55,
        image: 'assets/images/fruitBasket.png'),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: CustomColour.appTheme),
      darkTheme: ThemeData(brightness: Brightness.dark, primarySwatch: CustomColour.appTheme),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(backgroundColor: CustomColour.appTheme                                                                                                                                                                                                                                                          ,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_sharp,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
          title: const Text(' WishList ',style: TextStyle(color: Colors.white),),
          centerTitle: true,
        ),
        body: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
            shrinkWrap: true,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Card(
                color: notificationColour,
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset("assets/books.png",height: 80, width: 80,),
                      SizedBox(
                        width: 130,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 5.0,
                            ),
                            RichText(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              text: TextSpan(
                                  text: 'Name: ',
                                  style: TextStyle(
                                      color: Colors.blueGrey.shade800,
                                      fontSize: 16.0),
                                  children: [
                                    TextSpan(
                                        text:
                                        '${products[index].name.toString()}\n',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ]),
                            ),
                            RichText(
                              maxLines: 1,
                              text: TextSpan(
                                  text: 'Unit: ',
                                  style: TextStyle(
                                      color: Colors.blueGrey.shade800,
                                      fontSize: 16.0),
                                  children: [
                                    TextSpan(
                                        text:
                                        '${products[index].unit.toString()}\n',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)
                                    ),
                                  ]),
                            ),
                            RichText(
                              maxLines: 1,
                              text: TextSpan(
                                  text: 'Price: ' r"$",
                                  style: TextStyle(
                                      color: Colors.blueGrey.shade800,
                                      fontSize: 16.0),
                                  children: [
                                    TextSpan(
                                        text:
                                        '${products[index].price.toString()}\n',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ]),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: CustomColour.appTheme.shade700, shape: const ContinuousRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15)))),
                          onPressed: () {
                            _showToast('Product Added to Cart successfully');
                          },
                          child: const Text('Add to Cart',style: TextStyle(color: Colors.white),)
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}

void _showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

class Item {
  final String name;
  final String unit;
  final int price;
  final String image;

  Item({required this.name, required this.unit, required this.price, required this.image});

  Map toJson() {
    return {
      'name': name,
      'unit': unit,
      'price': price,
      'image': image,
    };
  }
}