import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:digi_text/model/AllBookListModel.dart';
import 'package:digi_text/utility/CustomColour.dart';
import 'package:digi_text/wishlist_page.dart';

import 'cart_page.dart';

class ProductDetail extends StatefulWidget {

  final BooksData? book;
  const ProductDetail({super.key, required this.book});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {

  int _radioSelected = 1;
  late String radioVal = "Paper Book";

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
          title: const Text('Product Detail',style: TextStyle(color: Colors.white),),
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
                    Image.network(widget.book!.imageUrl.toString(), height: 240),
                  ],
                ),
                Container(
                    alignment: Alignment.topRight,
                    child: Icon(widget.book?.imageUrl == false ? Icons. favorite_outline: Icons.favorite ,color: Colors.red,)
                )
              ]),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(widget.book!.productTitle.toString(),
                style: const TextStyle(
                  letterSpacing: 0.5,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
              child: Text.rich(
                  TextSpan(
                    text: 'Price : ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    // default text style
                    children: <TextSpan>[
                      TextSpan(
                        text: '\u{20B9} ${widget.book?.bookPrice}  ',
                        style: const TextStyle(
                          letterSpacing: 0.5,
                          color: Colors.black54,
                        ),
                      ),
                      TextSpan(
                        text: '\u{20B9} ${widget.book?.bookMrp}',style: const TextStyle(
                        letterSpacing: 0.5,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.red,
                      ),
                      ),
                      TextSpan(
                        text: ' (${widget.book?.bookPerDiscount}%)',style: const TextStyle(
                        letterSpacing: 0.5,
                        color: Colors.black54,
                      ),
                      )
                    ],
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text.rich(
                TextSpan(
                  text: 'Description : ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  // default text style
                  children: <TextSpan>[
                    TextSpan(
                      text:widget.book?.productTitle,
                      style: const TextStyle(
                        letterSpacing: 0.5,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Text.rich(
                TextSpan(
                  text: 'Board : ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  // default text style
                  children: <TextSpan>[
                    TextSpan(
                      text:
                      widget.book!.category.toString(),
                      style: const TextStyle(
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
              child: Text.rich(
                TextSpan(
                  text: 'Class : ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  // default text style
                  children: <TextSpan>[
                    TextSpan(
                      text:
                      widget.book!.className.toString(),
                      style: const TextStyle(
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
              child: Text.rich(
                TextSpan(
                  text: 'Subject : ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  // default text style
                  children: <TextSpan>[
                    TextSpan(
                      text:
                      widget.book!.subjectName.toString(),
                      style: const TextStyle(
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
                  text: 'Publisher : ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  // default text style
                  children: <TextSpan>[
                    TextSpan(
                      text:
                      'Rachna Sagar',
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
                  text: 'Author : ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  // default text style
                  children: <TextSpan>[
                    TextSpan(
                      text:
                      'Rajesh K. Dewan',
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
                  text: 'Language : ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  // default text style
                  children: <TextSpan>[
                    TextSpan(
                      text:
                      'English',
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
              child: Text.rich(
                TextSpan(
                  text: 'ISBN : ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  // default text style
                  children: <TextSpan>[
                    TextSpan(
                      text: widget.book?.isbn,
                      style: const TextStyle(
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
                  text: 'Weight : ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  // default text style
                  children: <TextSpan>[
                    TextSpan(
                      text: '0.8 KG',
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
                    'Review : ',
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
          ],
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: InkWell(
                child: Container(
                  color: CustomColour.appTheme,
                  alignment: Alignment.center,
                  height: 50.0,
                  margin: const EdgeInsets.all(5),
                  child: const Text(
                    'Add To Wishlist',
                    style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold,),
                  ),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const WishList()));
                },
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Cart()));
                },
                child: Container(
                  color: CustomColour.appTheme,
                  alignment: Alignment.center,
                  height: 50.0,
                  margin: const EdgeInsets.all(5),
                  child: const Text('Add To Cart',
                    style: TextStyle(
                      color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold,
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

