import 'dart:convert';

import 'package:bloc_state_management_tutorial/utils/urls.dart';
import 'package:http/http.dart' as http;

import '../models/login_model.dart';

class AuthRepository {
  Future<LoginModel?> login(String email, String password) async {
    final http.Response response = await http.post(
      Uri.parse(loginAPIUrl),
      body: {"email": email, "password": password},
    );
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      LoginModel loginModel = LoginModel.fromJson(data);
      return loginModel;
    }

    return null;
  }
}

