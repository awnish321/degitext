import 'package:flutter/material.dart';
import 'package:new_flutter_project/billing_page.dart';
import 'package:new_flutter_project/utility/CustomColour.dart';

class Cart extends StatefulWidget {
  const Cart({
    super.key,
  });

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  get deleteQuantity => null;
  get addQuantity => null;
  static const notificationColour = Color(0xFFF8F8F8);

  @override
  void initState() {
    super.initState();
    // context.read<CartProvider>().getData();
  }

  int _counter = 1;
  bool _canShowButton = true;

  void hideWidget() {
    setState(() {
      _canShowButton = !_canShowButton;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter>1){
        _counter--;
      }else{
        hideWidget();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: CustomColour.appTheme,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('My Shopping Cart',style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              !_canShowButton ? const SizedBox.shrink() : Card(
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
                                            text: 'S.S.T , Science',
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
                        IconButton(onPressed: _decrementCounter, icon: const Icon(Icons.remove)),Text('$_counter'),
                        IconButton(onPressed: _incrementCounter, icon: const Icon(Icons.add)),
                        IconButton(onPressed: _decrementCounter, icon: const Icon(Icons.delete,color: Colors.black,)),
                      ],
                    ),
                  ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: InkWell(
        onTap: () { Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BillingPage()),
        );
        },
        child: Container(
          color: CustomColour.appTheme,
          alignment: Alignment.center,
          height: 50.0,
          child: const Text(
            'Proceed to Pay',
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

// class PlusMinusButtons extends StatelessWidget {
//   final VoidCallback deleteQuantity;
//   final VoidCallback addQuantity;
//   final String text;
//
//   const PlusMinusButtons(
//       {Key? key,
//       required this.addQuantity,
//       required this.deleteQuantity,
//       required this.text})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         IconButton(onPressed: deleteQuantity, icon: const Icon(Icons.remove)),
//         Text(text),
//         IconButton(onPressed: addQuantity, icon: const Icon(Icons.add)),
//       ],
//     );
//   }
// }

// class ReusableWidget extends StatelessWidget {
//   final String title, value;
//
//   const ReusableWidget({Key? key, required this.title, required this.value});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             title,
//             style: Theme.of(context).textTheme.subtitle1,
//           ),
//           Text(
//             value.toString(),
//             style: Theme.of(context).textTheme.subtitle2,
//           ),
//         ],
//       ),
//     );
//   }
// }
