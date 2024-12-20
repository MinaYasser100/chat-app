import 'package:chat_app/core/constant/color/app_colors.dart';
import 'package:chat_app/core/constant/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> customShowDialog({
  required BuildContext context,
  required String title,
  required String content,
  required void Function() onPressed,
}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: AppColors.secondColor,
      title: Text(
        title,
        style: Styles.textStyle24White.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        content,
        style: Styles.textStyle20,
      ),
      actions: [
        ElevatedButton(
          onPressed: onPressed,
          child: Text(
            'نعم',
            style: Styles.textStyle18Gray.copyWith(
              color: AppColors.secondColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            'ألغاء',
            style: Styles.textStyle18Gray.copyWith(
              color: AppColors.secondColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    ),
  );
}
