import 'package:chat_app/core/constant/color/app_colors.dart';
import 'package:chat_app/core/constant/styles/styles.dart';
import 'package:chat_app/features/edit_info/presentation/views/widgets/edit_info_body_view.dart';
import 'package:flutter/material.dart';

class EditInfoView extends StatelessWidget {
  const EditInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'تعديل البيانات',
          style: Styles.textStyle24White.copyWith(fontWeight: FontWeight.w700),
        ),
      ),
      body: const EditInfoBodyView(),
    );
  }
}
