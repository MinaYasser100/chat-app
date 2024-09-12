import 'package:chat_app/core/constant/styles/styles.dart';
import 'package:flutter/material.dart';

class LoginBodySectionOne extends StatelessWidget {
  const LoginBodySectionOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 100,
        ),
        Image.asset('assets/images/welcome.jpg'),
        const SizedBox(
          height: 40,
        ),
        const Text(
          'تسجيل الدخول',
          style: Styles.textStyle30,
        ),
        const Text(
          'قوم بتسجيل الدخول لكي تستطيع الدردشة مع اصدقائك',
          style: Styles.textStyle18Gray,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
