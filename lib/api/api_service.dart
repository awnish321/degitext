import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:new_flutter_project/model/AllBookListModel.dart';

import '../model/Book.dart';

class ApiService {

  final String baseUrl = 'https://www.rachnasagar.in/digitextapp/api';

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

}