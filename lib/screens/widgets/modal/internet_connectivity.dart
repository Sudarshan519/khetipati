import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoInternetConnectionModal {
  NoInternetConnectionModal() {
    if (Get.isDialogOpen != true) {
      Get.dialog(
        AlertDialog(
          title: const Text('No Internet Connection!'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.wifi_off_outlined,
                size: 30,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                  'Please make sure you are connected to the internet and its working.'),
            ],
          ),
        ),
        barrierDismissible: true,
      );
    }
  }
}
