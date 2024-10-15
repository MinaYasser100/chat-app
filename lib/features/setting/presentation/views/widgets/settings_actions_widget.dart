import 'package:chat_app/core/helper/pages/get_pages.dart';
import 'package:chat_app/core/model/user_model.dart';
import 'package:chat_app/features/setting/data/model/settings_item_model.dart';
import 'package:chat_app/features/setting/presentation/manager/settings_cubit/settings_cubit.dart';
import 'package:chat_app/features/setting/presentation/views/func/custom_show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'settings_item_list_tile_widget.dart';

class SettingsActionsWidget extends StatelessWidget {
  const SettingsActionsWidget({
    super.key,
    required this.settingsItems,
    required this.userModel,
  });

  final List<SettingsItemModel> settingsItems;
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Column(
          children: [
            SettingsItemListTileWidget(
              settingsItemModel: settingsItems[0],
              onTap: () {
                Get.toNamed(GetPages.kEditInfoView);
              },
            ),
            SettingsItemListTileWidget(
              settingsItemModel: settingsItems[1],
              onTap: () {},
            ),
            SettingsItemListTileWidget(
              settingsItemModel: settingsItems[2],
              onTap: () {
                customShowDialog(
                  context: context,
                  title: 'تسجيل الخروج',
                  content: 'هل أنت بالفعل تريد تسجيل الخروج الأن',
                  onPressed: () {
                    context.read<SettingsCubit>().signOutService(userModel);
                  },
                );
              },
            ),
            SettingsItemListTileWidget(
              settingsItemModel: settingsItems[3],
              onTap: () {
                customShowDialog(
                  context: context,
                  title: 'حذف الحساب',
                  content: 'هل أنت بالفعل تريد حذف الحساب الخاص بك الأن',
                  onPressed: () {
                    context.read<SettingsCubit>().deleteUserAccount(userModel);
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }
}
