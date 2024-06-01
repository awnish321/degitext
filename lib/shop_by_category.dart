import 'package:flutter/material.dart';
import 'package:new_flutter_project/model/AllBookListModel.dart';
import 'package:new_flutter_project/product_detail.dart';
import 'package:new_flutter_project/utility/CustomColour.dart';
import 'api/api_service.dart';
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
  List<BooksData>? booksData;
  List<BooksData>? originalBooksData;
  List<BooksData>? filteredData;

  String boardDropDownValue = '';
  var boardList = [
    'Select Board',
    'C.B.S.E',
    'I.C.S.E/I.S.C',
    'G.C.E.R.T',
    'C.U.E.T-U.G(N.T.A)',
    'N.S.D.C',
    'State Boards',
    'Educational Kit',
  ];

  String classDropDownValue = '';
  var classList = [
    'Select Class',
    'Pre School (LKG)',
    'Pre Primary (UKG)',
    'Class 1',
    'Class 2',
    'Class 3',
    'Class 4',
    'Class 5',
    'Class 6',
    'Class 7',
    'Class 8',
    'Class 9',
    'Class 10',
    'Class 11',
    'Class 12',
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
    'Mathematics',
    'Social Studies',
    'Geography',
    'Sanskrit',
    'English Language & Literature',
    'Science',
  ];

  late Future<AllBookListModel> futureBookList;
  final ApiService apiService = ApiService();

  @override
  void initState() {
    boardDropDownValue = boardList[0];
    classDropDownValue = classList[0];
    booksTypeDropDownValue = bookList[0];
    subjectTypeDropDownValue = subjectList[0];
    futureBookList = apiService.fetchBookList("booksList");
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
                            onTap:()=> setState(() {
                              if (items=="C.B.S.E"){
                                booksData = originalBooksData;
                              }else if (items =="I.C.S.E/I.S.C"){
                                filteredData?.clear();
                                filteredData = originalBooksData?.where((i) => i.categoryId == 2.toString()).toList();
                                booksData = filteredData;
                              }else if (items =="G.C.E.R.T"){
                                filteredData?.clear();
                                filteredData = originalBooksData?.where((i) => i.categoryId == 9.toString()).toList();
                                booksData = filteredData;
                              }else if (items =="C.U.E.T-U.G(N.T.A)"){
                                filteredData?.clear();
                                filteredData = originalBooksData?.where((i) => i.categoryId == 6.toString()).toList();
                                booksData = filteredData;
                              }else if (items =="N.S.D.C"){
                                filteredData?.clear();
                                filteredData = originalBooksData?.where((i) => i.categoryId == 11.toString()).toList();
                                booksData = filteredData;
                              }else if (items =="State Boards"){
                                filteredData?.clear();
                                filteredData = originalBooksData?.where((i) => i.categoryId == 3.toString()).toList();
                                booksData = filteredData;
                              }else if (items =="Educational Kit"){
                                filteredData?.clear();
                                filteredData = originalBooksData?.where((i) => i.categoryId == 5.toString()).toList();
                                booksData = filteredData;
                              }else if (items =="Select Board"){
                                booksData = originalBooksData;
                              }
                            }),
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
                            onTap:()=> setState(() {
                              if (items=="Pre School (LKG)"){
                                filteredData?.clear();
                                filteredData = originalBooksData?.where((i) => i.className == "Pre School (LKG)").toList();
                                booksData = filteredData;
                              }else if (items=="Pre Primary (UKG)"){
                                filteredData?.clear();
                                filteredData = originalBooksData?.where((i) => i.className == "Pre Primary (UKG)").toList();
                                booksData = filteredData;
                              }else if (items =="Class 1"){
                                filteredData?.clear();
                                filteredData = originalBooksData?.where((i) => i.className == 1.toString()).toList();
                                booksData = filteredData;
                              }else if (items =="Class 2"){
                                filteredData?.clear();
                                filteredData = originalBooksData?.where((i) => i.className == 2.toString()).toList();
                                booksData = filteredData;
                              }else if (items =="Class 3"){
                                filteredData?.clear();
                                filteredData = originalBooksData?.where((i) => i.className == 3.toString()).toList();
                                booksData = filteredData;
                              }else if (items =="Class 4"){
                                filteredData?.clear();
                                filteredData = originalBooksData?.where((i) => i.className == 4.toString()).toList();
                                booksData = filteredData;
                              }else if (items =="Class 5"){
                                filteredData?.clear();
                                filteredData = originalBooksData?.where((i) => i.className == 5.toString()).toList();
                                booksData = filteredData;
                              }else if (items =="Class 6"){
                                filteredData?.clear();
                                filteredData = originalBooksData?.where((i) => i.className == 6.toString()).toList();
                                booksData = filteredData;
                              }else if (items =="Class 7"){
                                filteredData?.clear();
                                filteredData = originalBooksData?.where((i) => i.className == 7.toString()).toList();
                                booksData = filteredData;
                              }else if (items =="Class 8"){
                                filteredData?.clear();
                                filteredData = originalBooksData?.where((i) => i.className == 8.toString()).toList();
                                booksData = filteredData;
                              }else if (items =="Class 9"){
                                filteredData?.clear();
                                filteredData = originalBooksData?.where((i) => i.className == 9.toString()).toList();
                                booksData = filteredData;
                              }else if (items =="Class 10"){
                                filteredData?.clear();
                                filteredData = originalBooksData?.where((i) => i.className == 10.toString()).toList();
                                booksData = filteredData;
                              }else if (items =="Class 11"){
                                filteredData?.clear();
                                filteredData = originalBooksData?.where((i) => i.className == 11.toString()).toList();
                                booksData = filteredData;
                              }else if (items =="Class 12"){
                                filteredData?.clear();
                                filteredData = originalBooksData?.where((i) => i.className == 12.toString()).toList();
                                booksData = filteredData;
                              }else if (items =="Select Class"){
                                booksData = originalBooksData;
                              }
                            }),
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
                            onTap:()=> setState(() {
                              if (items =="Select Subject"){
                              booksData = originalBooksData;
                              }else{
                                filteredData?.clear();
                                filteredData = originalBooksData?.where((i) => i.subjectName==items).toList();
                                booksData=filteredData;
                              }
                            }),
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
                  future: futureBookList,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                        originalBooksData=snapshot.data?.booksData;
                        booksData??=snapshot.data?.booksData;
                      return GridView.builder(
                        shrinkWrap: true,
                        itemCount: booksData!.length,
                        itemBuilder: (context, index) {
                          final book = booksData?[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetail(book: book),
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
                                          image: NetworkImage(booksData![index].imageUrl!.toString()),)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, top: 5, right: 5, bottom: 0),
                                    child: Text(
                                      booksData![index].productTitle
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
                                            '\u{20B9} ${booksData![index].bookPrice}  ',
                                            style: const TextStyle(
                                              letterSpacing: 0.5,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            '\u{20B9}${booksData![index].bookMrp}',
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
                                            ' (${booksData![index].bookPerDiscount}%)',
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
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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


