import 'package:chat_app/core/constant/color/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void customSnackBar(
    {required String subTitle, required String text, Color? color}) {
  Get.snackbar(
    text,
    subTitle,
    snackPosition: SnackPosition.TOP,
    backgroundColor: color ?? AppColors.primaryColor,
    colorText: Colors.white,
  );
}
