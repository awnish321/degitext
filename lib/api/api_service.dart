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

  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl1 + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserModel> model = userModelFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

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