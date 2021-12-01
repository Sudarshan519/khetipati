import 'package:flutter/material.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';

buildAppBar(appbarTitle) {
  return AppBar(
    toolbarHeight: getHeight(80),
    automaticallyImplyLeading: false,
    backgroundColor: AppColors.mainGreen,
    elevation: 0,
    centerTitle: true,
    title: Text(
      appbarTitle,
      style: TextStyle(
          fontSize: getFont(22),
          color: AppColors.textGreen,
          fontWeight: FontWeight.w700),
    ),
    leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.arrow_back_ios_rounded,
            size: getFont(20), color: AppColors.textGreen)),
  );
}
