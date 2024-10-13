import 'package:chat_app/core/helper/hive/hive_helper.dart';
import 'package:chat_app/core/helper/pages/get_pages.dart';
import 'package:chat_app/core/model/user_model.dart';
import 'package:chat_app/features/setting/data/model/settings_item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'settings_item_list_tile_widget.dart';
import 'settings_user_info_widget.dart';

class SettingsBodyView extends StatefulWidget {
  const SettingsBodyView({super.key});

  @override
  State<SettingsBodyView> createState() => _SettingsBodyViewState();
}

class _SettingsBodyViewState extends State<SettingsBodyView> {
  UserModel userModel = HiveHelper.getUserData();
  List<SettingsItemModel> settingsItems = [
    SettingsItemModel(
      title: 'تعديل البيانات',
      leadingIcon: Icons.edit,
      trailing: Icons.arrow_forward_ios_rounded,
      onTap: () {
        Get.toNamed(GetPages.kEditInfoView);
      },
    ),
    SettingsItemModel(
      title: 'تسجيل الخروج',
      leadingIcon: Icons.logout,
      trailing: Icons.arrow_forward_ios_rounded,
      onTap: () {},
    ),
    SettingsItemModel(
      title: 'حذف الحساب',
      leadingIcon: Icons.delete_rounded,
      trailing: Icons.arrow_forward_ios_rounded,
      onTap: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          width: double.infinity,
        ),
        SettingsUserInfoWidget(userModel: userModel),
        Expanded(
          child: ListView.builder(
            itemCount: settingsItems.length,
            itemBuilder: (context, index) => SettingsItemListTileWidget(
              settingsItemModel: settingsItems[index],
            ),
          ),
        ),
      ],
    );
  }
}
