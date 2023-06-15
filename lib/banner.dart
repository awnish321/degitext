import 'package:flutter/material.dart';
import 'package:new_flutter_project/shop_by_category.dart';

class BannerPageView extends StatefulWidget {
  const BannerPageView({Key? key}) : super(key: key);

  @override
  State<BannerPageView> createState() => _MyAppState();
}

class _MyAppState extends State<BannerPageView> {

  final _pageController = PageController();
  final _pageController1 = PageController();
  final _pageController2 = PageController();
  double currentPage = 0;
  List<String> searchTerms = [
    "Apple",
    "Banana",
    "Mango",
    "Pear",
    "Watermelons",
    "Blueberries",
    "Pineapples",
    "Strawberries"
  ];

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!.toDouble();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Container( width: double.infinity,height: 55,margin: const EdgeInsets.only(bottom: 10,top: 3),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xffc9c1c1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Search for Items",
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: PageView(
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://images.unsplash.com/photo-1607355739828-0bf365440db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1444&q=80",
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://images.unsplash.com/photo-1584810359583-96fc3448beaa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(mainAxisSize: MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 5),
                      alignment: Alignment.centerLeft,
                      height: 9,
                      width: 9,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentPage == index
                            ? Colors.black
                            : Colors.black12,
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(height: 200,width: double.infinity,color: Colors.black,alignment: Alignment.center,padding: const EdgeInsets.all(15),margin: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 2),alignment: Alignment.center,
                    decoration: BoxDecoration(border: Border.all(color: Colors.white,),),width: double.infinity,
                    child: TextButton(onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ShopByCategory()),
                      );
                    },
                      child: const Text("Student/Parent",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold,)),),
                  ),
                  Container(margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 2),alignment: Alignment.center,
                    decoration: BoxDecoration(border: Border.all(color: Colors.white,),),width: double.infinity,
                    child: TextButton(onPressed: () {  },
                      child: const Text("Teacher/Schools",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold,)),),
                  ),
                  Container(margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 2),alignment: Alignment.center,
                    decoration: BoxDecoration(border: Border.all(color: Colors.white,),),width: double.infinity,
                    child: TextButton(onPressed: () {  },
                      child: const Text("Bookseller",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold,)),),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text("New Release",textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),),
            ),
            SizedBox(
              height: 200,
              child: PageView(
                controller: _pageController1,
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://images.unsplash.com/photo-1607355739828-0bf365440db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1444&q=80",
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://images.unsplash.com/photo-1584810359583-96fc3448beaa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text("Shop By Category",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),),
            ),
            SizedBox(
              height: 200,
              child: PageView(
                controller: _pageController2,
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://images.unsplash.com/photo-1607355739828-0bf365440db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1444&q=80",
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://images.unsplash.com/photo-1584810359583-96fc3448beaa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}