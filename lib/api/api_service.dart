import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../model/ClassModel.dart';
import '../model/TestModel.dart';
import '../model/UserModel.dart';
import 'constants.dart';

class ApiService {

  Map<String, String> qParams = {
    'action': 'classDropdown',
  };

  var headers = {
    'rsplkey': 'rspl',
    'Content-Type': 'application/json',
    'utoken': '654b271e64c621679091c5a880faf6fb5e6087eb1b2dc'
  };

  // Future<List<UserModel>?> getUsers() async {
  //   try {
  //     var url = Uri.parse(ApiConstants.baseUrl1 + ApiConstants.usersEndpoint);
  //     var response = await http.get(url);
  //     if (response.statusCode == 200) {
  //       List<UserModel> model = userModelFromJson(response.body);
  //       return model;
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  //   return null;
  // }

  Future<List<ClassModel>?> getClassList() async {
    try {
      final url = Uri .parse(ApiConstants.baseUrl);
      url.replace(queryParameters:qParams );
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<ClassModel> model = classModelFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<TestModel?> getTestList() async {
    try {
      final url = Uri .parse(ApiConstants.baseUrl3);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        TestModel model = testModelFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

}