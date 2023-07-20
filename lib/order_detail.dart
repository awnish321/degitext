import 'package:flutter/material.dart';
import 'package:new_flutter_project/utility/CustomColour.dart';

class OrderDetail extends StatelessWidget {
   OrderDetail({super.key});

  static const notificationColour = Color(0xFFD7D7D7);

  var description = Container(padding: const EdgeInsets.all(16), child: const Text(
    "A style icon gets some love from one of today's top "
        "trendsetters. Pharrell Williams puts his creative spin on these "
        "shoes, which have all the clean, classicdetails of the beloved Stan Smith.",
    textAlign: TextAlign.justify,
    style: TextStyle(height: 1.5, color: Color(0xFF6F8398)),
  )
  );

  @override
  Widget build(BuildContext context) {
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
          title: const Text('Order Detail'),
          centerTitle: true,
        ),
        body:
        SafeArea(
          child: Column(
            children: <Widget>[
              productImage(),
              description,
              Column(
                children: [
                  productDescription(),
                  Property(),
                ],
              ),
            ],
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

Widget Property(){
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