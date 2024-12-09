import 'package:chat_app/core/constant/color/app_colors.dart';
import 'package:chat_app/core/constant/styles/styles.dart';
import 'package:chat_app/core/model/user_model.dart';
import 'package:flutter/material.dart';

class CustomUserItemWidget extends StatelessWidget {
  const CustomUserItemWidget({
    super.key,
    required this.userModel,
  });
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            child: CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage(userModel.image),
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              userModel.name,
              style: Styles.textStyle20.copyWith(color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
