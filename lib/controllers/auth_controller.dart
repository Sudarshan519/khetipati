// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetipati/screens/home/home.dart';
import 'package:khetipati/services/user_services.dart';
import 'package:khetipati/utils/snackbar.dart';

import '../models/user.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  var authState = AuthState.UnAuthenticated.obs;
  var token = "".obs;
  var user = User().obs;
  final password = TextEditingController();
  final email = TextEditingController();
  var isloading = true.obs;

  void onInit() {
    email.text = "jyodeshshakya@gmail.com";
    password.text = "testing1234";
    super.onInit();
  }

  loginWithEmail({required String email, required String password}) async {
    authState.value = AuthState.Authenticating;

    var user = await userrepo.loginWithEmailandPassword(email, password);

    if (user != null) {
      token.value = user[1];
      authState.value = AuthState.Authenticated;
      print(token.value);
      Get.to(() => HomeScreen());
    } else {
      getSnackbar(message: "Error signing in");
      authState.value = AuthState.UnAuthenticated;
    }
  }

  getuserdata() async {
    try {
      isloading(true);
      var data = await userrepo.getuserInfo(authController.token.value);

      if (data != null) {
        user.value = data;
        print(user);
      }
    } finally {
      // TODO
      isloading(false);
    }
    // print(user.value);
    // userInfo.value = userFromJson(data);
  }
}

final authController = Get.find<AuthController>();
enum AuthState { UnAuthenticated, Authenticated, Authenticating }
