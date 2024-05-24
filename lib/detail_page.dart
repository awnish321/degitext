import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:new_flutter_project/utility/CustomColour.dart';
import 'package:new_flutter_project/wishlist_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'cart_page.dart';
import 'model/Book.dart';

class DetailPage extends StatelessWidget {
  final Book book;

  const DetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: const Text(
          'RACHNA SAGAR PVT. LTD',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Cart()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(15),
              child: Stack(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Image.network(book.imageUrl, height: 230),
                  ],
                ),
                Container(
                    alignment: Alignment.topRight,
                    child: Icon(book.imageUrl == false ? Icons. favorite_outline: Icons.favorite ,color: Colors.red,)
                )
              ]),
            ),
              const SizedBox(height: 16),
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(book.productTitle,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  letterSpacing: 0.5,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
              const SizedBox(height: 8),
              Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
              child: Text.rich(
                  TextSpan(
                    text: 'Price :  ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    // default text style
                    children: <TextSpan>[
                      TextSpan(
                        text: '\u{20B9} ${book.bookPrice}   ',
                        style: const TextStyle(
                          letterSpacing: 0.5,
                          color: Colors.black54,
                        ),
                      ),
                      TextSpan(
                        text: '\u{20B9} ${book.bookMrp}',style: const TextStyle(
                        letterSpacing: 0.5,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.red,
                      ),
                      ),
                      TextSpan(
                        text: ' (${book.bookPerDiscount}%)',style: const TextStyle(
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
                  text: 'Description :',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  // default text style
                  children: <TextSpan>[
                    TextSpan(
                      text:book.productTitle,
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
              Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
              child: Text.rich(
                TextSpan(
                  text: 'ISBN  :',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  // default text style
                  children: <TextSpan>[
                    TextSpan(
                      text: book.isbn,
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
                  text: 'Weight  :',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  // default text style
                  children: <TextSpan>[
                    TextSpan(
                      text: ' 0.8 KG',
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
              // ElevatedButton(
              //   onPressed: () {
              //     _launchURL(book.productUrl);
              //   },
              //   child: Text('View Product'),
              // ),
            ],
          ),
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
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
