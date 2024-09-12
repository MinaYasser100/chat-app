import 'package:chat_app/core/constant/color/app_colors.dart';
import 'package:chat_app/core/helper/pages/get_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginBodyNoAccount extends StatelessWidget {
  const LoginBodyNoAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 30),
      child: Column(
        children: [
          const Text(
            'ان كان ليس لديك حساب',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'يمكنك الان أنشاء',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.toNamed(GetPages.kRegisterView);
                },
                child: const Text(
                  'حساب جديد',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
