import 'dart:async';

import 'package:flutter/material.dart';
import 'package:new_flutter_project/model/AllBookListModel.dart';
import 'package:new_flutter_project/product_detail.dart';
import 'package:new_flutter_project/utility/CustomColour.dart';
import 'api/api_service.dart';
import 'cart_page.dart';
import 'dashboard_page.dart';
import 'model/BookstoreLocaterModel.dart';

class BookSellerList extends StatefulWidget {
  const BookSellerList({super.key});

  @override
  State<BookSellerList> createState() => _BookSellerListState();
}

class _BookSellerListState extends State<BookSellerList> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  int id = 1;
  List<ShopList>? shopList;
  List<ShopList>? originalShopList;
  List<ShopList>? filteredShopList;
  var filteredData = [];

  String stateDropDownValue = '';
  var stateList = [
    'Select State',
    'Andhra Pradesh',
    'Assam',
    'Bihar',
    'chhattisgarh',
    'Delhi',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jammu & Kashmir',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhaya Pradesh',
    'Maharashtra',
    'Meghalaya',
    'Orissa',
    'Port Blair',
    'Punjab',
    'Rajasthan',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal',
  ];

  String districtDropDownValue = '';
  var districtList = [];

  late Future<BookShopModel> futureShopList;
  final ApiService apiService = ApiService();

  @override
  void initState() {
    stateDropDownValue = stateList[0];
    futureShopList = apiService.fetchBookSellerList("bookstoreLocator");
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
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
            'Book Seller',
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
          padding: const EdgeInsets.all(10.0),
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
              // Image.asset("assets/books_location.jpg",height: 150,fit: BoxFit.fitHeight,
              // ),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      shadowColor: Colors.black,
                      color: Colors.grey[200],
                      child: DropdownButton(padding: const EdgeInsets.symmetric(horizontal: 8),
                        isExpanded: true,
                        value: stateDropDownValue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: stateList.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            onTap:()=> setState(() {
                              // dataSearch(items);
                              if (items =="Select State"){
                                shopList = originalShopList;
                              }else{
                                filteredShopList?.clear();
                                filteredShopList = originalShopList?.where((i) => i.shopState==items).toList();
                                shopList=filteredShopList;
                              }
                            }
                            ),
                            child: Text(
                              items,
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            stateDropDownValue = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                  // Expanded(
                  //   child: Card(
                  //     shadowColor: Colors.black,
                  //     color: Colors.grey[200],
                  //     child: DropdownButton(padding: const EdgeInsets.symmetric(horizontal: 8),
                  //       isExpanded: true,
                  //       value: districtDropDownValue,
                  //       icon: const Icon(Icons.keyboard_arrow_down),
                  //       items: districtList.map((String items) {
                  //         return DropdownMenuItem(
                  //           value: items,
                  //           // onTap:()=> setState(() {
                  //           //   if (items=="Pre School (LKG)"){
                  //           //     filteredData?.clear();
                  //           //     filteredData = originalShopList?.where((i) => i.className == "Pre School (LKG)").toList();
                  //           //     shopList = filteredData;
                  //           //   }else if (items=="Pre Primary (UKG)"){
                  //           //     filteredData?.clear();
                  //           //     filteredData = originalShopList?.where((i) => i.className == "Pre Primary (UKG)").toList();
                  //           //     shopList = filteredData;
                  //           //   }else if (items =="Class 1"){
                  //           //     filteredData?.clear();
                  //           //     filteredData = originalShopList?.where((i) => i.className == 1.toString()).toList();
                  //           //     shopList = filteredData;
                  //           //   }else if (items =="Class 2"){
                  //           //     filteredData?.clear();
                  //           //     filteredData = originalShopList?.where((i) => i.className == 2.toString()).toList();
                  //           //     shopList = filteredData;
                  //           //   }else if (items =="Class 3"){
                  //           //     filteredData?.clear();
                  //           //     filteredData = originalShopList?.where((i) => i.className == 3.toString()).toList();
                  //           //     shopList = filteredData;
                  //           //   }else if (items =="Class 4"){
                  //           //     filteredData?.clear();
                  //           //     filteredData = originalShopList?.where((i) => i.className == 4.toString()).toList();
                  //           //     shopList = filteredData;
                  //           //   }else if (items =="Class 5"){
                  //           //     filteredData?.clear();
                  //           //     filteredData = originalShopList?.where((i) => i.className == 5.toString()).toList();
                  //           //     shopList = filteredData;
                  //           //   }else if (items =="Class 6"){
                  //           //     filteredData?.clear();
                  //           //     filteredData = originalShopList?.where((i) => i.className == 6.toString()).toList();
                  //           //     shopList = filteredData;
                  //           //   }else if (items =="Class 7"){
                  //           //     filteredData?.clear();
                  //           //     filteredData = originalShopList?.where((i) => i.className == 7.toString()).toList();
                  //           //     shopList = filteredData;
                  //           //   }else if (items =="Class 8"){
                  //           //     filteredData?.clear();
                  //           //     filteredData = originalShopList?.where((i) => i.className == 8.toString()).toList();
                  //           //     shopList = filteredData;
                  //           //   }else if (items =="Class 9"){
                  //           //     filteredData?.clear();
                  //           //     filteredData = originalShopList?.where((i) => i.className == 9.toString()).toList();
                  //           //     shopList = filteredData;
                  //           //   }else if (items =="Class 10"){
                  //           //     filteredData?.clear();
                  //           //     filteredData = originalShopList?.where((i) => i.className == 10.toString()).toList();
                  //           //     shopList = filteredData;
                  //           //   }else if (items =="Class 11"){
                  //           //     filteredData?.clear();
                  //           //     filteredData = originalShopList?.where((i) => i.className == 11.toString()).toList();
                  //           //     shopList = filteredData;
                  //           //   }else if (items =="Class 12"){
                  //           //     filteredData?.clear();
                  //           //     filteredData = originalShopList?.where((i) => i.className == 12.toString()).toList();
                  //           //     shopList = filteredData;
                  //           //   }else if (items =="Select Class"){
                  //           //     shopList = originalShopList;
                  //           //   }
                  //           // }),
                  //           child: Text(
                  //             items,
                  //           ),
                  //         );
                  //       }).toList(),
                  //       onChanged: (String? newValue) {
                  //         setState(() {
                  //           districtDropDownValue = newValue!;
                  //         });
                  //       },
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              const SizedBox (height: 10,),
              Expanded(
                child: FutureBuilder<BookShopModel>(
                  future: futureShopList,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      originalShopList=snapshot.data?.shopList;
                      shopList??=snapshot.data?.shopList;
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: shopList!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 2,
                            child: Column(
                              children: [
                                ListTile(
                                  visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                                  leading: const Icon(Icons.home),
                                  iconColor: CustomColour.appTheme,
                                  title: Text('Shop name  : ${shopList![index].shopName.toString()}',
                                      style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                                  textColor: Colors.black,
                                ),
                                ListTile(
                                  visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                                  leading: const Icon(Icons.phone),
                                  iconColor: CustomColour.appTheme,
                                  title: Text('Contact number  : ${shopList![index].shopMobile.toString()}',
                                      style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                                  textColor: Colors.black,
                                ),
                                ListTile(
                                  visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                                  leading: const Icon(Icons.email),
                                  iconColor: CustomColour.appTheme,
                                  title: Text('Email id  : ${shopList![index].shopEmailId.toString()}',
                                      style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                                  textColor: Colors.black,
                                ),
                                ListTile(
                                  visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                                  leading: const Icon(Icons.pin),
                                  iconColor: CustomColour.appTheme,
                                  title: Text('Pincode  : ${shopList![index].shopPincode.toString()}',
                                      style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                                  textColor: Colors.black,
                                ),
                                ListTile(
                                  visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                                  leading: const Icon(Icons.location_on),
                                  iconColor: CustomColour.appTheme,
                                  title: Text('Address  : ${shopList![index].shopAddress.toString()}',
                                      style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                                  textColor: Colors.black,
                                ),
                              ],
                            ),
                          );
                        },
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
