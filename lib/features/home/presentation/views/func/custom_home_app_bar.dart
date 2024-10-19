import 'package:chat_app/core/constant/color/app_colors.dart';
import 'package:chat_app/core/constant/styles/styles.dart';
import 'package:chat_app/core/constant/title/titles.dart';
import 'package:chat_app/core/helper/pages/get_pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:chat_app/core/model/user_model.dart';

AppBar customHomeAppBar() {
  return AppBar(
    backgroundColor: AppColors.primaryColor,
    foregroundColor: Colors.white,
    leadingWidth: 70,
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
    title: ValueListenableBuilder(
      valueListenable: Hive.box<UserModel>(Titles.userModelHive).listenable(),
      builder: (context, Box<UserModel> box, _) {
        // Get the user data from the box
        UserModel? user = box.values.isNotEmpty ? box.values.first : null;

        // Return a Text widget with the user's name or a default value
        return FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            user != null ? _getFirstTwoWords(user.name) : 'Guest',
            style:
                Styles.textStyle24White.copyWith(fontWeight: FontWeight.w700),
          ),
        );
      },
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

String _getFirstTwoWords(String fullName) {
  List<String> words = fullName.split(' ');
  if (words.length > 2) {
    // Join the first three words
    return '${words[0]} ${words[1]} ${words[2]}';
  } else {
    // If the name has less than three words, return the full name
    return fullName;
  }
}
