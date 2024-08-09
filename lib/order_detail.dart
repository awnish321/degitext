import 'package:flutter/material.dart';
import 'package:digi_text/utility/CustomColour.dart';

class OrderDetail extends StatelessWidget {
   const OrderDetail({super.key});

  static const notificationColour = Color(0xFFD7D7D7);

  @override
  Widget build(BuildContext context) {
    const notificationColour = Color(0xFFD7D7D7);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColour.appTheme,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_sharp,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
          title: const Text('Order Detail',style: TextStyle(color: Colors.white),),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(color: notificationColour,padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                Card(
                  color: Colors.white,
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                border: Border.all(),), //             <--- BoxDecoration here
                              child:
                              Image.asset(
                                "assets/books.png",
                                height: 65,
                                width: 55,fit: BoxFit.fill,
                              ),
                            ),
                            const Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Text(
                                  "This is a long text, This is a long text, This is a long text, This is a long text",style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54
                                ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(margin: const EdgeInsets.only(left: 5,right: 15,top: 10,bottom: 5),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: const [
                              Text("Quantity",style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              )
                              ),
                              Text("1",style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              )
                              ),
                            ],
                          ),
                        ),
                        Container(margin: const EdgeInsets.only(left: 5,right: 15,top: 10,bottom: 5),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: const [
                              Text("Amount",style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              )
                              ),
                              Text("480",style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              )
                              ),
                            ],
                          ),
                        ),
                        Container(margin: const EdgeInsets.only(left: 5,right: 15,top: 10,bottom: 5),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: const [
                              Text("Payment Status",style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              )
                              ),
                              Text("Success",style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              )
                              ),
                            ],
                          ),
                        ),
                        Container(margin: const EdgeInsets.only(left: 5,right: 15,top: 10,bottom: 5),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: const [
                              Text("Order Date",style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              )
                              ),
                              Text("11/11/2023",style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              )
                              ),
                            ],
                          ),
                        ),
                        Container(margin: const EdgeInsets.only(left: 5,right: 15,top: 10,bottom: 5),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: const [
                              Text("Delivery Status",style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              )
                              ),
                              Text("Delivered",style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              )
                              ),
                            ],
                          ),
                        ),
                        Container(margin: const EdgeInsets.only(left: 5,right: 15,top: 10,bottom: 5),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: const [
                              Text("Delivery Date",style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              )
                              ),
                              Text("15/11/2023",style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              )
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Card(
                    color: Colors.white,
                    elevation: 5.0,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(margin: const EdgeInsets.only(left: 5,right: 15,top: 10,bottom: 5),
                            child: const Text("Delivery Address",style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54
                            )
                            ),
                          ),
                          Container(margin: const EdgeInsets.all(5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Awnish kumar  ',
                                  style: TextStyle(
                                    color: Colors.black54, fontSize: 15.0,fontWeight: FontWeight.bold,),
                                ),
                                SizedBox(height: 3),
                                Text('8210260336  ',
                                  style: TextStyle(
                                    color: Colors.black54, fontSize: 15.0,fontWeight: FontWeight.bold,),
                                ),
                                SizedBox(height: 5),
                                Text('4583/15, Daryaganj, New Delhi – 110002, INDIA  ',
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 15.0),
                                ),
                              ],
                            ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}

Widget productDescription(){
  return Container(
    padding: const EdgeInsets.all(16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: <Widget>[
        //     const Text("Color"),
        //     Row(
        //       children: <Widget>[
        //         Container(
        //           decoration: const BoxDecoration(
        //               color: Colors.red,
        //               shape: BoxShape.circle
        //           ),
        //           width: 30,
        //           height: 30,
        //           margin: const EdgeInsets.all(5),
        //         ),
        //         Container(
        //           decoration: const BoxDecoration(
        //               color: Colors.green,
        //               shape: BoxShape.circle
        //           ),
        //           width: 30,
        //           height: 30,
        //           margin: const EdgeInsets.all(5),
        //         ),
        //         Container(
        //           decoration: const BoxDecoration(
        //               color: Colors.yellow,
        //               shape: BoxShape.circle
        //           ),
        //           width: 30,
        //           height: 30,
        //           margin: const EdgeInsets.all(5),
        //         ),
        //         Container(
        //           decoration: const BoxDecoration(
        //               color: Colors.pink,
        //               shape: BoxShape.circle
        //           ),
        //           width: 30,
        //           height: 30,
        //           margin: const EdgeInsets.all(5),
        //         ),
        //       ],)
        //   ],
        // ),
        Column(
          children: const <Widget>[
            Text("Quantity"),
            Text("1",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2F2F3E)
              ),
            )
          ],
        ),
        Column(
          children: const <Widget>[
            Text("Order Date"),
            Text("11/11/2023",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2F2F3E)
              ),
            )
          ],
        ),
        Column(
          children: const <Widget>[
            Text("Order Status"),
            Text("Delivered",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2F2F3E)
              ),
            )
          ],
        ),
      ],),
  );
}

Widget property(){
  return Container(
    padding: const EdgeInsets.all(16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: const <Widget>[
            Text("Amount"),
            Text("480",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2F2F3E)
              ),
            )
          ],
        ),
        Column(
          children: const <Widget>[
            Text("Payment Status"),
            Text("Success",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2F2F3E)
              ),
            )
          ],
        ),
        Column(
          children: const <Widget>[
            Text("Delivery Date"),
            Text("18/11/2023",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2F2F3E)
              ),
            )
          ],
        ),
      ],),
  );
}

Widget productImage(){
  return Container(padding: const EdgeInsets.all(5),
    child: Card(
      elevation: 5,shadowColor: Colors.redAccent,
      child: Stack(
        children: <Widget>[
          Container(height: 230,color: OrderDetail.notificationColour),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/books.png",height: 210),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget product(){
  return Container(color: Colors.white38,
    child: Column(
      children: [
        Card(
          color: Colors.white,
          elevation: 5.0,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(0.5),
                      decoration: BoxDecoration(
                        border: Border.all(),), //             <--- BoxDecoration here
                      child:
                      Image.asset(
                        "assets/books.png",
                        height: 60,
                        width: 50,fit: BoxFit.fill,
                      ),
                    ),
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          "This is a long text, This is a long text, This is a long text, This is a long text",style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54
                        ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(margin: const EdgeInsets.only(left: 5,right: 15,top: 10,bottom: 5),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                      Text("Quantity",style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54
                      )
                      ),
                      Text("1",style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54
                      )
                      ),
                    ],
                  ),
                ),
                Container(margin: const EdgeInsets.only(left: 5,right: 15,top: 10,bottom: 5),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                      Text("Amount",style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54
                      )
                      ),
                       Text("480",style: TextStyle(
                           fontSize: 18,
                           fontWeight: FontWeight.bold,
                           color: Colors.black54
                       )
                       ),
                    ],
                  ),
                ),
                Container(margin: const EdgeInsets.only(left: 5,right: 15,top: 10,bottom: 5),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                      Text("Payment Status",style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54
                      )
                      ),
                       Text("Success",style: TextStyle(
                           fontSize: 18,
                           fontWeight: FontWeight.bold,
                           color: Colors.black54
                       )
                       ),
                    ],
                  ),
                ),
                Container(margin: const EdgeInsets.only(left: 5,right: 15,top: 10,bottom: 5),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                      Text("Order Date",style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54
                      )
                      ),
                       Text("11/11/2023",style: TextStyle(
                           fontSize: 18,
                           fontWeight: FontWeight.bold,
                           color: Colors.black54
                       )
                       ),
                    ],
                  ),
                ),
                Container(margin: const EdgeInsets.only(left: 5,right: 15,top: 10,bottom: 5),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                      Text("Delivery Date",style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54
                      )
                      ),
                       Text("15/11/2023",style: TextStyle(
                           fontSize: 18,
                           fontWeight: FontWeight.bold,
                           color: Colors.black54
                       )
                       ),
                    ],
                  ),
                ),
                Container(margin: const EdgeInsets.only(left: 5,right: 15,top: 10,bottom: 5),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                      Text("Delivery Status",style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54
                      )
                      ),
                       Text("Delivery",style: TextStyle(
                           fontSize: 18,
                           fontWeight: FontWeight.bold,
                           color: Colors.black54
                       )
                       ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Card(
            color: Colors.white,
            elevation: 5.0,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(margin: const EdgeInsets.only(left: 5,right: 15,top: 10,bottom: 5),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Text("Quantity",style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54
                        )
                        ),
                        Text("1",style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54
                        )
                        ),
                      ],
                    ),
                  ),
                  Container(margin: const EdgeInsets.only(left: 5,right: 15,top: 10,bottom: 5),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Text("Amount",style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54
                        )
                        ),
                         Text("480",style: TextStyle(
                             fontSize: 18,
                             fontWeight: FontWeight.bold,
                             color: Colors.black54
                         )
                         ),
                      ],
                    ),
                  ),
                  Container(margin: const EdgeInsets.only(left: 5,right: 15,top: 10,bottom: 5),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Text("Payment Status",style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54
                        )
                        ),
                         Text("Success",style: TextStyle(
                             fontSize: 18,
                             fontWeight: FontWeight.bold,
                             color: Colors.black54
                         )
                         ),
                      ],
                    ),
                  ),
                  Container(margin: const EdgeInsets.only(left: 5,right: 15,top: 10,bottom: 5),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Text("Order Date",style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54
                        )
                        ),
                         Text("11/11/2023",style: TextStyle(
                             fontSize: 18,
                             fontWeight: FontWeight.bold,
                             color: Colors.black54
                         )
                         ),
                      ],
                    ),
                  ),
                  Container(margin: const EdgeInsets.only(left: 5,right: 15,top: 10,bottom: 5),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Text("Delivery Status",style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54
                        )
                        ),
                         Text("15/11/2023",style: TextStyle(
                             fontSize: 18,
                             fontWeight: FontWeight.bold,
                             color: Colors.black54
                         )
                         ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}