import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/initialbinding.dart';

import 'package:khetipati/screens/splash/splashscreen.dart';

void main() async {
  // await DBHelper.initDB();
  // await BoxStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'KhetiPati',
        theme: ThemeData(
          primaryColor: AppColors.mainGreen,
          primarySwatch: Colors.green,
        ),
        initialBinding: InitialBinding(),
        home: const SplashScreen());
  }
}
