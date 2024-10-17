import 'package:chat_app/core/constant/styles/styles.dart';
import 'package:chat_app/core/helper/widgets/custom_user_image.dart';
import 'package:chat_app/core/model/user_model.dart';
import 'package:flutter/material.dart';

class SettingsUserInfoWidget extends StatelessWidget {
  const SettingsUserInfoWidget({
    super.key,
    required this.userModel,
  });

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        CustomUserImage(
          image: userModel.image,
        ),
        Text(
          userModel.name,
          style: Styles.textStyle26White.copyWith(
            color: Colors.black,
          ),
        ),
        Text(
          userModel.email,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            top: 15,
            right: 30,
            left: 30,
          ),
          child: Divider(),
        ),
      ],
    );
  }
}
