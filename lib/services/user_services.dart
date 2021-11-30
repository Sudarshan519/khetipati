import 'dart:convert';

import 'package:get/get.dart';
import 'package:khetipati/models/user.dart';
import 'package:khetipati/utils/snackbar.dart';
import 'package:khetipati/utils/storage/auth_storage.dart';
import 'package:http/http.dart' as http;

class UserRepo extends GetConnect {
  static const base = "http://192.168.10.149:8000/userapi";
  static const login = base + "/login/";
  static const register = base + "/register";
  static const recoverypassword = base + "/recoveryPassword";

  ///register
  registerwithEmailAndPassword(
      // String firstName,
      // String lastname,
      // String email,
      // String phone,
      // String password,
      ) async {
    var body = {
      "firstname": "Sudarshan",
      "lastname": "Shrestha",
      "email": "s@gmail.com",
      "phone": "98277473",
      "password": "testing1234",
      "password_confirm": "testing1234"
    };
    final Response response = await post(register, body);

    print(response.body);
  }

  ///login
  loginWithEmailandPassword() async {
    var body = {"email": "sudarshan@gmail.com", "password": "testing1234"};
    print("loggin in");
    var response = await http.post(
        Uri.parse("http://192.168.10.149:8000/userapi/login"),
        body: body);
    print(response.statusCode);
    var result = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return result;
    } else {
      getSnackbar(message: "error loggin in");
      return null;
    }
  }

  ///get user info
  getuserInfo() async {
    var token = AppStorage.token;
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final Response response = await get(base + "/user", headers: headers);

    if (response.body != null) {
      var userdata = response.body;
    }
  }

  ///recovery password
  recoveryPassword() async {
    String email = "s@gmail.com";
    var body = {"email": email};
    final Response response = await post(recoverypassword, body);
    print(response.body);
  }

  ///reset password
  resetPassword(String token, String email, String newPassword) async {
    var body = {"token": token, "email": email, "password": newPassword};
    final Response response = await post(base + "/resetPassword", body);
    print(response.body);
  }
}

final userrepo = UserRepo();
