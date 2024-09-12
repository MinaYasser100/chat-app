import 'package:chat_app/core/constant/color/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Padding registerBackToLogin() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 40),
    child: Row(
      children: [
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const CircleAvatar(
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    ),
  );
}
