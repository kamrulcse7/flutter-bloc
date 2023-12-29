import 'package:dio/dio.dart';

import '../models/user_model.dart';

class APIServices {
  final dio = Dio();
  Future<List<UserModel>> getData() async {
    List<UserModel> userData = [];
    try {

      Response response = await dio.get('https://jsonplaceholder.typicode.com/users');

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
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
