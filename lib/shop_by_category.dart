import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart%20';
import 'package:new_flutter_project/model/AllBookListModel.dart';
import 'package:new_flutter_project/utility/CustomColour.dart';
import 'cart_page.dart';

class ShopByCategory extends StatefulWidget {
  const ShopByCategory({Key? key}) : super(key: key);

  @override
  State<ShopByCategory> createState() => _ShopByCategoryState();
}

class _ShopByCategoryState extends State<ShopByCategory> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  int _selectedIndex = 0;
  String radioButtonItem = 'Student';
  int id = 1;

  String boardDropDownValue = '';
  var boardList = [
    'Select Board',
    'C.B.S.E',
    'I.C.S.E/I.S.C',
    'G.C.E.R.T',
    'C.U.E.T-U.G(N.T.A)',
    'N.S.D.C',
    'Educational Kit',
  ];

  String classDropDownValue = '';
  var classList = [
    'Select Class',
    'Class 1',
    'Class 2',
    'Class 3',
    'Class 4',
    'Class 5',
  ];

  String booksTypeDropDownValue = '';
  var bookList = [
    'Types of Books',
    'Textbook',
    'Workbook',
    'Workbook cum practice material',
    'worksheets',
    'Trm',
  ];

  String subjectTypeDropDownValue = '';
  var subjectList = [
    'Select Subject',
    'Hindi',
    'English',
    'Math',
    'S.S.T',
    'Science',
  ];

  late AllBookListModel _myData;

  AllBookListModel get myData => _myData;

  get outputList => null;

  Future<AllBookListModel> getProductsApi() async {
    final registerData = jsonEncode({"action": 'allBooks'});
    Map<String, String> headers = {
      'rsplkey': 'rspl',
      'Content-Type': 'application/json'
    };
    Response response = await http.post(
      Uri.parse('https://www.rachnasagar.in/digitextapp/api/booksList'),
      headers: headers,
      body: registerData,
    );
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      AllBookListModel model = AllBookListModel.fromJson(data);
      AllBookListModel filteredData = AllBookListModel.fromJson(data);
      final data1 = AllBookListModel.fromJson(jsonDecode(response.body));
      _myData = data1;
      // filteredData.booksData?.clear();
      // for(int i=0; i<model.booksData!.length; i++){
      //   if("350" == model.booksData?[i].bookMrp){
      //     filteredData.booksData?.add(model.booksData?[i] as BooksData);
      //   }
      // }
      return _myData;
    } else {
      AllBookListModel model = AllBookListModel.fromJson(data);
      return model;
    }
  }

  @override
  void initState() {
    boardDropDownValue = boardList[0];
    classDropDownValue = classList[0];
    booksTypeDropDownValue = bookList[0];
    subjectTypeDropDownValue = subjectList[0];
    super.initState();
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
              // Container(
              //     width: double.infinity,
              //     margin: const EdgeInsets.only(left:5,right: 5, bottom: 10),
              //     alignment: Alignment.center,
              //     decoration: BoxDecoration(
              //       color: CustomColour.appTheme.shade800,
              //       border: Border.all(
              //           color: CustomColour.appTheme.shade800, // Set border color
              //           width: 3.0), // Set border width
              //       borderRadius: const BorderRadius.all(
              //           Radius.circular(10.0)), // Set rounded corner radius
              //     ),
              //     padding: const EdgeInsets.all(10),
              //     child: InkWell(
              //       child:  const Text(
              //         'CBSE',
              //         style: TextStyle(
              //           color: Colors.white,
              //           fontSize: 18,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //       onTap: () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(builder: (context) => const ShopByCategory()),
              //         );
              //       },
              //     )
              // ),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      shadowColor: Colors.black,
                      color: Colors.grey[200],
                      child: DropdownButton(padding: const EdgeInsets.symmetric(horizontal: 8),
                        isExpanded: true,
                        value: boardDropDownValue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: boardList.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            // onTap:()=> _filterBoard(items),
                            child: Text(
                              items,
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            boardDropDownValue = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      shadowColor: Colors.black,
                      color: Colors.grey[200],
                      child: DropdownButton(padding: const EdgeInsets.symmetric(horizontal: 8),
                        isExpanded: true,
                        value: classDropDownValue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: classList.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            classDropDownValue = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Card(
                elevation: 1,
                shadowColor: Colors.black,
                color: Colors.grey[200],
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      DropdownButton(
                        isExpanded: true,
                        value: booksTypeDropDownValue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: bookList.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            booksTypeDropDownValue = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 1,
                shadowColor: Colors.black,
                color: Colors.grey[200],
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      DropdownButton(
                        isExpanded: true,
                        value: subjectTypeDropDownValue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: subjectList.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            subjectTypeDropDownValue = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: FutureBuilder<AllBookListModel>(
                  future: getProductsApi(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.booksData!.length,
                        itemBuilder: (context, index) {
                          return Card(
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
                                        image: NetworkImage(snapshot
                                            .data!.booksData![index].imageUrl!
                                            .toString()),
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5, top: 5, right: 5, bottom: 0),
                                  child: Text(
                                    snapshot
                                        .data!.booksData![index].productTitle
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
                                          '\u{20B9} ${snapshot.data!.booksData![index].bookPrice}  ',
                                          style: const TextStyle(
                                            letterSpacing: 0.5,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          '\u{20B9}${snapshot.data!.booksData![index].bookMrp}',
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
                                          ' (${snapshot.data!.booksData![index].bookPerDiscount}%)',
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


// _filterBoard(String boardType) {
//   setState(() {
//     switch (boardType) {
//       case 'C.B.S.E':
//       filteredData.booksData?.clear();
//       for(int i=0; i<model.booksData!.length; i++){
//         if("C.B.S.E" == model.booksData?[i].bookMrp){
//           filteredData.booksData?.add(model.booksData?[i] as BooksData);
//         }
//       }
//         ;
//         break;
//       case 'I.C.S.E/I.S.C':
//         cellText = new Text('red');
//         break;
//       case 'G.C.E.R.T':
//         cellText = new Text('green');
//         break;
//       case 'C.U.E.T-U.G(N.T.A)':
//         cellText = new Text('yellow');
//         break;
//       case 'N.S.D.C':
//         cellText = new Text('orange');
//         break;
//         case 'Educational Kit':
//         cellText = new Text('orange');
//         break;
//       default:
//         cellText = new Text('brown');
//         break;
//     }
//   });
// }

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


