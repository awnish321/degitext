import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({
    Key? key,
  }) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  get deleteQuantity => null;

  get addQuantity => null;
  static const notificationColour = Color(0xFFD7D7D7);

  // DBHelper? dbHelper = DBHelper();

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
        centerTitle: true,
        title: const Text('My Shopping Cart'),
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
                      IconButton(onPressed: deleteQuantity, icon: const Icon(Icons.remove)),
                      const Text("1",
                          style: TextStyle(color: Colors.black54,
                          )),
                      IconButton(onPressed: addQuantity, icon: const Icon(Icons.add)),
                      IconButton(onPressed: addQuantity, icon: const Icon(Icons.delete,color: Colors.black,)),
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
                      IconButton(onPressed: deleteQuantity, icon: const Icon(Icons.remove)),
                      const Text("1",
                          style: TextStyle(color: Colors.black54,
                          )),
                      IconButton(onPressed: addQuantity, icon: const Icon(Icons.add)),
                      IconButton(onPressed: addQuantity, icon: const Icon(Icons.delete,color: Colors.black,)),
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

class PlusMinusButtons extends StatelessWidget {
  final VoidCallback deleteQuantity;
  final VoidCallback addQuantity;
  final String text;

  const PlusMinusButtons(
      {Key? key,
      required this.addQuantity,
      required this.deleteQuantity,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: deleteQuantity, icon: const Icon(Icons.remove)),
        Text(text),
        IconButton(onPressed: addQuantity, icon: const Icon(Icons.add)),
      ],
    );
  }
}

class ReusableWidget extends StatelessWidget {
  final String title, value;

  const ReusableWidget({Key? key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            value.toString(),
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
    );
  }
}
