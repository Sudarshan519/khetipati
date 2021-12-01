import 'package:get/get.dart';
import 'package:khetipati/screens/home/tabs/home_tab.dart';
import 'package:khetipati/services/user_services.dart';
import 'package:khetipati/utils/snackbar.dart';

import '../models/user.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  var authState = AuthState.UnAuthenticated.obs;
  var token = "".obs;
  var user = User().obs;
  loginWithEmail({required String email, required String password}) async {
    authState.value = AuthState.Authenticating;

    List user = await userrepo.loginWithEmailandPassword(email, password);

    if (user[0] != null) {
      token.value = user[1];
      authState.value = AuthState.Authenticated;
      print(token.value);
      Get.to(() => HomeScreen());
    } else {
      getSnackbar(message: "Error signing in");
      authState.value = AuthState.UnAuthenticated;
    }
  }
}

final authController = Get.find<AuthController>();
enum AuthState { UnAuthenticated, Authenticated, Authenticating }