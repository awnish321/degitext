import 'package:flutter/material.dart';
import 'package:new_flutter_project/order_detail.dart';
import 'package:new_flutter_project/profile_page.dart';
import 'package:new_flutter_project/utility/CustomColour.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({
    Key? key,
  }) : super(key: key);

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  static const notificationColour = Color(0xFFD7D7D7);

  @override
  void initState() {
    super.initState();
    // context.read<CartProvider>().getData();
  }

  @override
  Widget build(BuildContext context) {
    // final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,backgroundColor: CustomColour.appTheme,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('My Order',style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: notificationColour,
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/books.png",
                        height: 70,
                        width: 70,
                      ),
                      Expanded(
                        child: Container(margin: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                text: const TextSpan(
                                    text: 'Name : ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0),
                                    children: [
                                      TextSpan(
                                          text: 'English hindi math',
                                          style: TextStyle(
                                            color: Colors.black54,
                                            overflow: TextOverflow.ellipsis,
                                          )),
                                    ]),
                              ),
                              RichText(
                                maxLines: 1,
                                text: const TextSpan(
                                    text: 'Unit : ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0),
                                    children: [
                                      TextSpan(
                                          text: 'Piece',
                                          style: TextStyle(
                                            color: Colors.black54,
                                          )),
                                    ]),
                              ),
                              RichText(
                                maxLines: 1,
                                text: const TextSpan(
                                    text: 'Price : ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0),
                                    children: [
                                      TextSpan(
                                          text: '350',
                                          style: TextStyle(color: Colors.black54,
                                          )),
                                    ]),
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios_rounded),
                        color: Colors.black54,
                        onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetail()));},
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: notificationColour,
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/books.png",
                        height: 70,
                        width: 70,
                      ),
                      Expanded(
                        child: Container(margin: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                text: const TextSpan(
                                    text: 'Name : ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0),
                                    children: [
                                      TextSpan(
                                          text: 'English hindi math',
                                          style: TextStyle(
                                            color: Colors.black54,
                                            overflow: TextOverflow.ellipsis,
                                          )),
                                    ]),
                              ),
                              RichText(
                                maxLines: 1,
                                text: const TextSpan(
                                    text: 'Unit : ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0),
                                    children: [
                                      TextSpan(
                                          text: 'Piece',
                                          style: TextStyle(
                                            color: Colors.black54,
                                          )),
                                    ]),
                              ),
                              RichText(
                                maxLines: 1,
                                text: const TextSpan(
                                    text: 'Price : ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0),
                                    children: [
                                      TextSpan(
                                          text: '350',
                                          style: TextStyle(color: Colors.black54,
                                          )),
                                    ]),
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetail()));},
                        icon: const Icon(Icons.arrow_forward_ios_rounded,color: Colors.black54,),),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

