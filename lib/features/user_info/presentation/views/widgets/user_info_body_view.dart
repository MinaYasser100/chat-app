import 'package:chat_app/core/constant/styles/styles.dart';
import 'package:chat_app/core/helper/pages/get_pages.dart';
import 'package:chat_app/core/helper/widgets/custom_user_image.dart';
import 'package:chat_app/core/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserInfoBodyView extends StatelessWidget {
  const UserInfoBodyView({super.key, required this.userModel});
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(GetPages.kUserImageWidget,
                  arguments: userModel.image);
            },
            child: CustomUserImage(
              image: userModel.image,
              isBigImage: true,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 5),
            child: Divider(),
          ),
          Text(
            userModel.name,
            style: Styles.textStyle30.copyWith(
              color: Colors.black,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 5),
            child: Divider(),
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
