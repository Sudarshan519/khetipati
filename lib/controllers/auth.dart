import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:khetipati/screens/home/home.dart';
import 'package:khetipati/services/user_services.dart';
import 'package:khetipati/utils/storage/auth_storage.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  final email = TextEditingController();
  final password = TextEditingController();
  var authState = AuthState.UnAuthenticated.obs;

  loginWithEmail() async {
    authState.value = AuthState.Authenticating;
    AuthStorage.reset();

    List user = await userrepo.loginWithEmailandPassword();

    if (user[0] != null) {
      AuthStorage.setToken(user[1]);
      print(user[0]);
      AuthStorage.setUser(user[0]);
      authState.value = AuthState.Authenticated;
      Get.to(() => const Home());
    }
  }
}

final authController = Get.find<AuthController>();
enum AuthState { UnAuthenticated, Authenticated, Authenticating }
