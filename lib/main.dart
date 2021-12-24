import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/initialbinding.dart';

import 'package:khetipati/screens/splash/splashscreen.dart';
import 'package:khetipati/utils/storage/box_storage.dart';

void main() async {
  await BoxStorage.init();
  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'KhetiPati',
        theme: ThemeData(
          primaryColor: AppColors.mainGreen,
          primarySwatch: Colors.green,
        ),
        initialBinding: InitialBinding(),
        home: const SplashScreen());
  }
}
