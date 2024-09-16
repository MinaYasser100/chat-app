import 'package:chat_app/core/constant/color/app_colors.dart';
import 'package:chat_app/core/constant/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> showDialogChangePassword(
    {required BuildContext context,
    required String title,
    required String content}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        title,
        style: const TextStyle(color: AppColors.primaryColor),
      ),
      content: Text(
        content,
        style: Styles.textStyle18Gray.copyWith(color: Colors.white),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text('Ok'.tr),
        ),
      ],
    ),
  );
}
