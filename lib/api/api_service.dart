import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:new_flutter_project/model/AllBookListModel.dart';
import '../model/ClassModel.dart';
import '../model/TestModel.dart';
import 'constants.dart';

class ApiService {

  Map<String, String> qParams = {
    'action': 'classDropdown',
  };

  Map<String,String> headers = {'rsplkey': 'rspl', 'Content-Type': 'application/json'};

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

  Future<AllBookListModel?> getAllBookList() async {
  final registerData = jsonEncode({"action" : "allBooks"});
    try{
      Response response = await post(
        Uri.parse('https://www.rachnasagar.in/rsws/api/booksList'),
        headers: headers,
        body: registerData,
      );
      if(response.statusCode == 200){
        var data = jsonDecode(response.body.toString());
        if(data['status']=="true")
        {
          print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");

          // AllBookListModel model = AllBookListModel.fromJson(response.body.toString());
        //   return model;
        }else{
          print("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
        }
      }else {
        print('cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc');
      }
    }catch(e){
      print(e.toString());
    }
    return null;
  }

}