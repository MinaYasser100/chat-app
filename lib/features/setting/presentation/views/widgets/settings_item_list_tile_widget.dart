import 'package:chat_app/core/constant/color/app_colors.dart';
import 'package:chat_app/core/constant/styles/styles.dart';
import 'package:chat_app/features/setting/data/model/settings_item_model.dart';
import 'package:flutter/material.dart';

class SettingsItemListTileWidget extends StatelessWidget {
  const SettingsItemListTileWidget({
    super.key,
    required this.settingsItemModel,
  });
  final SettingsItemModel settingsItemModel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(settingsItemModel.leadingIcon),
      onTap: settingsItemModel.onTap,
      iconColor: AppColors.primaryColor,
      title: Text(
        settingsItemModel.title,
        style: Styles.textStyle20,
      ),
      trailing: Icon(settingsItemModel.trailing),
    );
  }
}
