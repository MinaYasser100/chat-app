import 'package:chat_app/core/constant/color/app_colors.dart';
import 'package:chat_app/core/constant/styles/styles.dart';
import 'package:chat_app/core/model/user_model.dart';
import 'package:chat_app/features/user_info/presentation/views/widgets/user_info_body_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserInfoView extends StatelessWidget {
  const UserInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel userModel = Get.arguments as UserModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        title: Text(
          userModel.name,
          style: Styles.textStyle24White.copyWith(fontWeight: FontWeight.w700),
        ),
        titleSpacing: 0.0,
      ),
      body: UserInfoBodyView(
        userModel: userModel,
      ),
    );
  }
}
