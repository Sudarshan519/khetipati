import "package:flutter/material.dart";
import 'package:khetipati/constant/colors.dart';

import '../../constant/size_config.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfigs().init(context);
    return Scaffold(
      backgroundColor: AppColors.mainGreen,
      body: Container(
        alignment: Alignment.center,
        child: Image.asset('assets/images/applogo.png',
            width: MediaQuery.of(context).size.width / 1.5,
            fit: BoxFit.scaleDown),
      ),
    );
  }
}
