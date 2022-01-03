import 'package:get/get.dart';
import 'package:khetipati/models/user.dart';

class UserToken {
  String token = "";

  // set setToken(value) => token = value;
  get getToken => token;

  setToken(body) {
    token = body;
  }
}

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
    // print(response.body);
    print(response.body);
    // UserToken().setToken(response.body);
  }

  ///login
  loginWithEmailandPassword(String email, String password) async {
    var body = {"email": email, "password": password};

    try {
      var response = await post("http://192.168.1.11:8080/userapi/login", body);
      var user = response.body;
      User currentuser = User.fromJson(user["user"]);
      var token = user["token"];

      return [
        currentuser,
        token,
      ];
    } on Exception catch (e) {
      // TODO
    }
  }

  ///get user info
  getuserInfo(String token) async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final Response response = await get(base + "/user", headers: headers);

    if (response.body != null) {
      var userdata = response.body;
      // User user = User.fromJson(userdata);
      // return user;
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
