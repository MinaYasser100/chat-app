import 'package:chat_app/core/constant/color/app_colors.dart';
import 'package:chat_app/core/constant/styles/styles.dart';
import 'package:chat_app/core/constant/title/titles.dart';
import 'package:chat_app/core/helper/pages/get_pages.dart';
import 'package:chat_app/core/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

AppBar customAllUsersAppBar() {
  return AppBar(
    title: const Text(
      'أصدقائك',
      style: Styles.textStyle26White,
    ),
    backgroundColor: AppColors.primaryColor,
    foregroundColor: Colors.white,
    leading: Padding(
      padding: const EdgeInsets.only(right: 10, bottom: 5),
      child: ValueListenableBuilder(
        valueListenable: Hive.box<UserModel>(Titles.userModelHive).listenable(),
        builder: (context, Box<UserModel> box, _) {
          UserModel? user = box.values.isNotEmpty ? box.values.first : null;

          return CircleAvatar(
            backgroundImage: user?.image != null
                ? NetworkImage(user!.image)
                : const AssetImage('assets/images/chat.jpg') as ImageProvider,
          );
        },
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {
          Get.toNamed(GetPages.kSettingView);
        },
        icon: const Icon(FontAwesomeIcons.gear),
      ),
    ],
  );
}
