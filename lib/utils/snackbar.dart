import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetipati/constant/colors.dart';

void getSnackbar({String? message, Color? bgColor, IconData? leadingIcon}) =>
    Get.showSnackbar(
      GetBar(
        onTap: (value) {
          Get.back();
        },
        duration: const Duration(milliseconds: 1600),
        message: message ?? "message",
        animationDuration: const Duration(milliseconds: 600),
        isDismissible: true,
        shouldIconPulse: false,
        dismissDirection: SnackDismissDirection.HORIZONTAL,
        icon: Icon(
          leadingIcon, //?? Icons.info_outline,
          color: Colors.white,
        ),
        backgroundColor: bgColor ?? AppColors.mainGreen,
      ),
    );
