import 'package:chat_app/core/constant/color/app_colors.dart';
import 'package:chat_app/core/constant/styles/styles.dart';
import 'package:chat_app/features/setting/presentation/views/widgets/settings_body_view.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'الأعدادات',
          style: Styles.textStyle24White.copyWith(fontWeight: FontWeight.w700),
        ),
      ),
      body: const SettingsBodyView(),
    );
  }
}
