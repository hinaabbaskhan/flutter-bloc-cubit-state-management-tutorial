import 'package:bloc_state_management_tutorial/networking.dart';
import 'package:bloc_state_management_tutorial/utils/urls.dart';
import '../models/login_model.dart';

class AuthRepository {
  Future<LoginModel?> login(String email, String password) async {
    NetworkHelper networkHelper = NetworkHelper(loginAPIUrl);
    final loginJsonResponse = await networkHelper.postData(
      body: {"email": email, "password": password},
    );
    LoginModel loginModel = LoginModel.fromJson(loginJsonResponse);
    return loginModel;
  }
}
