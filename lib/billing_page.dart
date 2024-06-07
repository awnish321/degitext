import 'package:flutter/material.dart';
import 'package:new_flutter_project/billing_page.dart';
import 'package:new_flutter_project/payment_page.dart';
import 'package:new_flutter_project/saved_address_page.dart';
import 'package:new_flutter_project/utility/CustomColour.dart';

class BillingPage extends StatefulWidget {
  const BillingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<BillingPage> createState() => _BillingPageState();
}

class _BillingPageState extends State<BillingPage> {
  static const notificationColour = Color(0xFFF8F8F8);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColour.appTheme,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text('Billing page',style: TextStyle(color: Colors.white),),
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
                        height: 50,
                        width: 50,
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
                                          text: 'S.S.T , Science',
                                          style: TextStyle(
                                            color: Colors.black54,
                                            overflow: TextOverflow.ellipsis,
                                          )),
                                    ]),
                              ),
                            ],
                          ),
                        ),
                      ),
                      RichText(
                        text: const TextSpan(
                            text: '1*350 = ',
                            style: TextStyle(color: Colors.black54,
                            )
                        ),
                      ),
                      RichText(
                        text: const TextSpan(
                            text: '350',
                            style: TextStyle(color: Colors.black54,
                            )
                        ),
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
                        height: 50,
                        width: 50,
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
                            ],
                          ),
                        ),
                      ),
                      RichText(
                        text: const TextSpan(
                            text: '2*450 = ',
                            style: TextStyle(color: Colors.black54,
                            )
                        ),
                      ),
                      RichText(
                        text: const TextSpan(
                            text: '900',
                            style: TextStyle(color: Colors.black54,
                            )
                        ),
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
                  child: Column(
                    children: [
                      Container(height: 20,child: const Text("Order Detail",textAlign: TextAlign.end,style: TextStyle(fontWeight: FontWeight.bold),)),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(margin: const EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      text: const TextSpan(
                                          text: 'Total MRP  : ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            RichText(
                              text: const TextSpan(
                                  text: '1250',
                                  style: TextStyle(color: Colors.black54,
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(margin: const EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      text: const TextSpan(
                                        text: 'Discount (-)  : ',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            RichText(
                              text: const TextSpan(
                                  text: '45',
                                  style: TextStyle(color: Colors.black54,
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(margin: const EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      text: const TextSpan(
                                        text: 'Total  : ',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            RichText(
                              text: const TextSpan(
                                  text: '1205',
                                  style: TextStyle(color: Colors.black54,
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(margin: const EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      text: const TextSpan(
                                        text: 'Shipping Charge(+)  : ',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            RichText(
                              text: const TextSpan(
                                  text: '49',
                                  style: TextStyle(color: Colors.black54,
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(margin: const EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      text: const TextSpan(
                                        text: 'Grand Total  : ',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            RichText(
                              text: const TextSpan(
                                  text: '1254',
                                  style: TextStyle(color: Colors.black54,
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: notificationColour,
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children:  [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          const Text("Shipping Address",style: TextStyle(fontWeight: FontWeight.bold),),
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.black,),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const SavedAddress()),
                              );
                            },
                          ),
                        ],
                      ),
                      const Text('Awnish kumar  ',
                        style: TextStyle(
                          color: Colors.black54, fontSize: 15.0,fontWeight: FontWeight.bold,),
                      ),
                      const SizedBox(height: 3),
                      const Text('8210260336  ',
                        style: TextStyle(
                          color: Colors.black54, fontSize: 15.0,fontWeight: FontWeight.bold,),
                      ),
                      const SizedBox(height: 5),
                      const Text('4583/15, Daryaganj, New Delhi – 110002, INDIA  ',
                        style: TextStyle(
                            color: Colors.black54, fontSize: 15.0),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) => const PaymentPage()));
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(
        //     content: Text('Checkout'),
        //     duration: Duration(seconds: 2),
        //   ),
        // );
        },
        child: Container(
          color: CustomColour.appTheme,
          alignment: Alignment.center,
          height: 50.0,
          child: const Text(
            'Checkout',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

