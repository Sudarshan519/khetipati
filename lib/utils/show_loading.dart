import 'package:flutter/material.dart';
import 'package:get/get.dart';

showLoadingWidget() {
  Get.defaultDialog(
      title: "Loading...",
      content: const CircularProgressIndicator(),
      barrierDismissible: false);
}

dismissLoadingWidget() {
  Get.back();
}
