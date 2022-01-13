// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetipati/models/user.dart';
import 'package:khetipati/screens/login/login.dart';
import 'package:khetipati/services/app_service.dart';
import 'package:khetipati/utils/snackbar.dart';

class RegisterController extends GetxController {
  final password = TextEditingController();
  final email = TextEditingController();
  final passwordConfirm = TextEditingController();
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final phone = TextEditingController();
  var userInfo = User().obs;

  void onInit() {
    super.onInit();
  }

  register() async {
    var response = AppServices().register(email.text, password.text,
        passwordConfirm.text, firstname.text, lastname.text, phone.text);
  }

  userDetails() async {
    var details = AppServices().register(email.text, password.text,
        passwordConfirm.text, firstname.text, lastname.text, phone.text);

    details = userInfo as Future;
  }
}
