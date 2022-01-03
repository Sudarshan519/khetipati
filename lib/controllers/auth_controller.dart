import 'package:get/get.dart';
import 'package:khetipati/screens/home/home.dart';
import 'package:khetipati/services/app_service.dart';
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

    try {
      List users =
          await AppServices().loginWithEmailandPassword(email, password);
      if (users[0] != null) {
        print(user);
        token.value = users[1];
        user.value = users[0];
        authState.value = AuthState.Authenticated;

        Get.to(() => HomeScreen());
      } else {
        getSnackbar(message: "Error signing in");
        authState.value = AuthState.UnAuthenticated;
      }
    } catch (e) {
      getSnackbar(message: "Error signing in");
    }
  }
}

final authController = Get.find<AuthController>();
enum AuthState { UnAuthenticated, Authenticated, Authenticating }
