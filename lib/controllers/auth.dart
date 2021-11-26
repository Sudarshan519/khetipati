import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:khetipati/screens/home/home.dart';
import 'package:khetipati/services/user_services.dart';
import 'package:khetipati/utils/storage/auth_storage.dart';

import '../models/user.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  var authState = AuthState.UnAuthenticated.obs;
  var token = "".obs;
  var user = User().obs;
  loginWithEmail() async {
    authState.value = AuthState.Authenticating;
    AuthStorage.reset();

    List user = await userrepo.loginWithEmailandPassword();

    if (user[0] != null) {
      AuthStorage.setToken(user[1]);
      // print(user[0]);
      AuthStorage.setUser(user[0]);
      authState.value = AuthState.Authenticated;
      Get.to(() => Home());
    }
  }
}

final authController = Get.find<AuthController>();
enum AuthState { UnAuthenticated, Authenticated, Authenticating }
