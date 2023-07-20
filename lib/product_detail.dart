import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:new_flutter_project/utility/CustomColour.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  get deleteQuantity => null;

  get addQuantity => null;

  int _radioSelected = 1;

  late String radioVal = "Paper Book";

  double? _rating;
  IconData? _selectedIcon;

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
          title: const Text('Product Detail'),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(color: CustomColour.appTheme),
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.black12, //add it here
              ),
              margin: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Text('Paper Book'),
                  Radio(
                    value: 1,
                    groupValue: _radioSelected,
                    activeColor: CustomColour.appTheme,
                    onChanged: (value) {
                      setState(() {
                        _radioSelected = value!;
                        radioVal = 'Paper Book';
                      });
                    },
                  ),
                  const Text('E Book'),
                  Radio(
                    value: 2,
                    groupValue: _radioSelected,
                    activeColor: CustomColour.appTheme,
                    onChanged: (value) {
                      setState(() {
                        _radioSelected = value!;
                        radioVal = 'E Book';
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Stack(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/books.png", height: 210),
                  ],
                ),
                Container(
                    alignment: Alignment.topRight,
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ))
              ]),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Together With CBSE Class 11 Mathematics Question Bank/Study Material Exam 2023-24 (Based on the latest Syllabus)',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  letterSpacing: 0.5,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15,right: 15,top: 15),
              child: Text.rich(
                TextSpan(
                  text: 'Price :  ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  // default text style
                  children: <TextSpan>[
                    TextSpan(
                      text: '\u{20B9} 360   ',
                      style: TextStyle(
                      letterSpacing: 0.5,
                      color: Colors.black54,
                    ),
                    ),
                    TextSpan(
                      text: '\u{20B9} 400',style: TextStyle(
                      letterSpacing: 0.5,
                      decoration: TextDecoration.lineThrough,
                      color: Colors.red,
                    ),
                    ),
                    TextSpan(
                      text: ' (10%)',style: TextStyle(
                      letterSpacing: 0.5,
                      color: Colors.black54,
                    ),
                    )
                      ],
                )
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text.rich(
                TextSpan(
                  text: 'Description :',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  // default text style
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          'Together with CBSE Question Bank Class 11 Mathematics Exam for session 2023-24 has been prepared as per the CBSE latest syllabus for Academic Session 2023-24.'
                          ' Chapter wise Question Bank provide in depth knowledge of concept based questions and their weightage to prepare for CBSE Mathematics Exam.',
                      style: TextStyle(
                        letterSpacing: 0.5,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),textAlign: TextAlign.justify,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text.rich(
                TextSpan(
                  text: 'Publisher :',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  // default text style
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          ' Rachna Sagar',
                      style: TextStyle(
                        letterSpacing: 0.5,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),textAlign: TextAlign.justify,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15,right: 15,top: 15),
              child: Text.rich(
                TextSpan(
                  text: 'Binding  :',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  // default text style
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          ' Paperback',
                      style: TextStyle(
                        letterSpacing: 0.5,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),textAlign: TextAlign.justify,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15,right: 15,top: 15),
              child: Text.rich(
                TextSpan(
                  text: 'Author   :',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  // default text style
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          ' Rajesh K. Dewan',
                      style: TextStyle(
                        letterSpacing: 0.5,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),textAlign: TextAlign.justify,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15,right: 15,top: 15),
              child: Text.rich(
                TextSpan(
                  text: 'Language   :',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  // default text style
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          ' English',
                      style: TextStyle(
                        letterSpacing: 0.5,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),textAlign: TextAlign.justify,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15,right: 15,top: 15),
              child: Text.rich(
                TextSpan(
                  text: 'ISBN  :',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  // default text style
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          ' 9789356189744',
                      style: TextStyle(
                        letterSpacing: 0.5,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),textAlign: TextAlign.justify,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15,right: 15,top: 15),
              child: Text.rich(
                TextSpan(
                  text: 'Weight  :',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  // default text style
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          ' 0.8 KG',
                      style: TextStyle(
                        letterSpacing: 0.5,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
              child: Row(
                children: [
                  const Text(
                    'Review :  ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  RatingBarIndicator(
                      rating: 2.5,
                      itemCount: 5,
                      itemSize: 20.0,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.red,
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(5),
                child: InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Add To Wishlist'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: Container(
                    color: CustomColour.appTheme,
                    alignment: Alignment.center,
                    height: 50.0,
                    child: const Text(
                      'Add To Wishlist',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(5),
                child: InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Add to Cart'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: Container(
                    color: CustomColour.appTheme,
                    alignment: Alignment.center,
                    height: 50.0,
                    child: const Text(
                      'Add To Cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
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

