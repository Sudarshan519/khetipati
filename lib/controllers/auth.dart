import 'package:get/get.dart';
import 'package:khetipati/screens/home/home.dart';
import 'package:khetipati/services/user_services.dart';

import '../models/user.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  var authState = AuthState.UnAuthenticated.obs;
  var _token = "".obs;
  var _user = User().obs;
  get user => _user.value;
  get token => _token.value;

  ///login
  loginWithEmail() async {
    authState.value = AuthState.Authenticating;

    var userinfo = await userrepo.loginWithEmailandPassword();
    if (userinfo == null) {
      authState.value = AuthState.UnAuthenticated;
    } else {
      _token.value = userinfo["token"];
      print(token);
      _user.value = User.fromJson(userinfo["user"]);
      authState.value = AuthState.Authenticated;
      Get.to(() => Home());
    }
  }

  ///register
  registerWithEmail() async {
    var userinfo = await userrepo.registerwithEmailAndPassword();
  }

  ///set user to local storage
  setUser(User user) {}
}

final authController = Get.find<AuthController>();
enum AuthState { UnAuthenticated, Authenticated, Authenticating }
