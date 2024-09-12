import 'package:chat_app/core/constant/color/app_colors.dart';
import 'package:flutter/material.dart';

class LoginBodyNoAccount extends StatelessWidget {
  const LoginBodyNoAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
              onPressed: () {},
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
    );
  }
}
