import 'package:chat_app/core/constant/color/app_colors.dart';
import 'package:chat_app/core/helper/hive/hive_helper.dart';
import 'package:chat_app/features/home/presentation/views/home_view.dart';
import 'package:chat_app/features/login/presentation/views/login_view.dart';
import 'package:flutter/material.dart';

import 'widgets/splash_body_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 8), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) =>
              HiveHelper.getUserLogin() ? const HomeView() : const LoginView(),
        ),
        (route) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.secondColor,
      body: SplashBodyView(),
    );
  }
}
