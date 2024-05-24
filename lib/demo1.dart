import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_flutter_project/model/AllBookListModel.dart';
import 'package:new_flutter_project/detail_page.dart';
import 'package:new_flutter_project/utility/CustomColour.dart';
import 'cart_page.dart';
import 'model/Book.dart';
import 'package:new_flutter_project/api/api_service.dart';

class Demo1 extends StatefulWidget {
  const Demo1({Key? key}) : super(key: key);

  @override
  State<Demo1> createState() => _DemoState();
}

class _DemoState extends State<Demo1> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late Future<List<Book>> futureBookList;
  final ApiService apiService = ApiService();

  @override
  void initState() {
    futureBookList = apiService.fetchBooksData();
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: CustomColour.appTheme),
      darkTheme: ThemeData(
          brightness: Brightness.dark, primarySwatch: CustomColour.appTheme),
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder<List<Book>>(
                  future: futureBookList,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Book> booksData = snapshot.data!;
                    return GridView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final book = booksData[index];
                          return GestureDetector(
                              onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(book: book),
                              ),
                            );
                          },
                              child: Card(
                            elevation: 2,
                            child: Column(
                              children: [

                                Container(
                                  height: MediaQuery.of(context).size.height * .25,
                                  width: MediaQuery.of(context).size.width * .45,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        width: 1,
                                      ),
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(snapshot.data![index].imageUrl!.toString()),)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5, top: 5, right: 5, bottom: 0),
                                  child: Text(
                                    snapshot
                                        .data![index].productTitle
                                        .toString(),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      letterSpacing: 0.5,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 2, top: 5, right: 2, bottom: 0),
                                  child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '\u{20B9} ${snapshot.data![index].bookPrice}  ',
                                          style: const TextStyle(
                                            letterSpacing: 0.5,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          '\u{20B9}${snapshot.data![index].bookMrp}',
                                          style: const TextStyle(
                                            letterSpacing: 0.5,
                                            decoration:
                                            TextDecoration.lineThrough,
                                            decorationColor: Colors.red,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          ' (${snapshot.data![index].bookPerDiscount}%)',
                                          style: const TextStyle(
                                            letterSpacing: 0.5,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ]),
                                ),
                                // Icon(snapshot.data!.booksData![index].imageUrl! == false ? Icons.favorite : Icons.favorite_outline)
                              ],
                            ),
                          ),
                          );
                        },
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          crossAxisSpacing: 0.0,
                          mainAxisSpacing: 5,
                          mainAxisExtent: 320,
                        ),
                      );
                    } else {
                      return bodyProgress;
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

var bodyProgress = Stack(
  children: <Widget>[
    Container(
      alignment: AlignmentDirectional.center,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Container(
        decoration:  BoxDecoration(
          // color: CustomColour.appTheme.shade100,
            borderRadius:  BorderRadius.circular(10.0)
        ),
        width: double.maxFinite,
        height: double.maxFinite,
        alignment: AlignmentDirectional.center,
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Center(
              child:  SizedBox(
                height: 50.0,
                width: 50.0,
                child:  CircularProgressIndicator(
                  value: null,
                  strokeWidth: 5.0,color: CustomColour.appTheme,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 25.0),
              child:  const Center(
                child:  Text(
                  "loading.. wait...",
                  style:  TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  ],
);


