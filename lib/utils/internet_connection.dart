import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class InternetConnection {
  checkConnection() async {
    try {
      final result = await InternetAddress.lookup("www.google.com");
      print(result);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        return true;
        // getSnackbar(message: "Error on Server connection");
      } else {
        print("server error");
        return false;
        // NoInternetConnectionModal();
        // Get.defaultDialog(
        //   title: 'Server Error',
        //   content: Container(
        //       height: 200,
        //       width: 200,
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           Text(
        //             "Issue on Server.Try aagin later",
        //             style: TextStyle(fontSize: 30),
        //           ),
        //           Spacer(),
        //           TextButton(onPressed: () {}, child: Text("OK")),
        //         ],
        //       )),
        // );
      }
    } on SocketException catch (_) {
      print(_.osError);
      print('not connected');
    }
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

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
