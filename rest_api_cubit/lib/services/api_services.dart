import 'dart:convert';

import 'package:rest_api_cubit/models/user_model.dart';
import 'package:http/http.dart' as http;

class APIServices {
  Future<List<UserModel>> getData() async {
    List<UserModel> userData = [];
    try {
      var request = http.Request(
          'GET', Uri.parse('https://jsonplaceholder.typicode.com/users'));
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var rawData = await response.stream.bytesToString();
        List<dynamic> data = jsonDecode(rawData);
        for (var e in data) {
          UserModel userModel = UserModel.fromJson(e);
          userData.add(userModel);
        }
        return userData;
      } else {
        return <UserModel>[];
      }
    } catch (e) {
      throw e;
    }
  }
}
