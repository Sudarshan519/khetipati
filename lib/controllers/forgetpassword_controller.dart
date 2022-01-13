import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:khetipati/services/app_service.dart';

class ForgetPasswordController extends GetxController {
  final TextEditingController email = TextEditingController();

  forgetPassword() async {
    await AppServices().forgetpassword(email.text);
  }
}
