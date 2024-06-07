import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:new_flutter_project/bookseller_list.dart';
import 'package:new_flutter_project/model/AllBookListModel.dart';
import 'package:new_flutter_project/model/AllProductListModel.dart';
import 'package:new_flutter_project/model/BookstoreLocaterModel.dart';

import '../model/Book.dart';

class ApiService {

  final String baseUrl = 'https://www.rachnasagar.in/digitextapp/api';
  final String baseUrl1 = 'https://www.rachnasagar.in/digitextapp/api/flutter';

  Future<AllBookListModel> fetchBookList(String endPoint) async {
    final registerData = jsonEncode({"action": 'allBooks'});
    Map<String, String> headers = {
      'rsplkey': 'rspl',
      'Content-Type': 'application/json'
    };
    Response response = await http.post(
      Uri.parse('$baseUrl/$endPoint'),
      headers: headers,
      body: registerData,
    );
    if (response.statusCode == 200) {
      return AllBookListModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<List<Book>> fetchBooksData() async {
    final registerData = jsonEncode({"action": 'allBooks'});
    Map<String, String> headers = {
      'rsplkey': 'rspl',
      'Content-Type': 'application/json'
    };
    Response response = await http.post(
      Uri.parse('$baseUrl/booksList'),
      headers: headers,
      body: registerData,
    );
    if (response.statusCode == 200) {
      return parseBooks(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<AllProductListModel> fetchProductList(String endPoint) async {
    final registerData = jsonEncode({"action": 'allProducts'});
    Map<String, String> headers = {
      'rsplkey': 'rspl',
      'utoken': 'Products',
      'Content-Type': 'application/json'
    };
    Response response = await http.post(
      Uri.parse('$baseUrl1/$endPoint'),
      headers: headers,
      body: registerData,
    );
    if (response.statusCode == 200) {
      return AllProductListModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<BookShopModel> fetchBookSellerList(String endPoint) async {
    final registerData = jsonEncode({"action": 'bookstore'});
    Map<String, String> headers = {
      'rsplkey': 'rspl',
      'utoken': 'Products',
      'Content-Type': 'application/json'
    };
    Response response = await http.post(
      Uri.parse('$baseUrl1/$endPoint'),
      headers: headers,
      body: registerData,
    );
    if (response.statusCode == 200) {
      return BookShopModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<AllProductListModel> fetchSearchProduct(String endPoint) async {
    final registerData = jsonEncode({"action": 'allProducts'});
    Map<String, String> headers = {
      'rsplkey': 'rspl',
      'utoken': 'Products',
      'Content-Type': 'application/json'
    };
    Response response = await http.post(
      Uri.parse('$baseUrl1/$endPoint'),
      headers: headers,
      body: registerData,
    );
    if (response.statusCode == 200) {
      return AllProductListModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }


}