import 'package:chat_app/core/constant/color/app_colors.dart';
import 'package:chat_app/core/constant/styles/styles.dart';
import 'package:chat_app/core/helper/hive/hive_helper.dart';
import 'package:chat_app/core/helper/pages/get_pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

AppBar customHomeAppBar() {
  return AppBar(
    backgroundColor: AppColors.primaryColor,
    foregroundColor: Colors.white,
    leadingWidth: 70,
    leading: Padding(
      padding: const EdgeInsets.only(right: 10, bottom: 5),
      child: CircleAvatar(
        backgroundImage: NetworkImage(HiveHelper.getUserData().image),
      ),
    ),
    title: FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        _getFirstTwoWords(HiveHelper.getUserData().name),
        style: Styles.textStyle24White.copyWith(fontWeight: FontWeight.w700),
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

String _getFirstTwoWords(String fullName) {
  List<String> words = fullName.split(' ');
  if (words.length > 1) {
    // Join the first two words
    return '${words[0]} ${words[1]} ${words[2]}';
  } else {
    // If the name has less than two words, return the full name
    return fullName;
  }
}
