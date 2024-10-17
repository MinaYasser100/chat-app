import 'package:chat_app/core/helper/pages/get_pages.dart';
import 'package:chat_app/core/model/user_model.dart';
import 'package:chat_app/features/setting/data/model/settings_item_model.dart';
import 'package:chat_app/features/setting/presentation/manager/settings_cubit/settings_cubit.dart';
import 'package:chat_app/features/setting/presentation/views/func/custom_show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../func/custom_password_show_widget.dart';
import 'settings_item_list_tile_widget.dart';

class SettingsActionsWidget extends StatefulWidget {
  const SettingsActionsWidget({
    super.key,
    required this.settingsItems,
    required this.userModel,
  });

  final List<SettingsItemModel> settingsItems;
  final UserModel userModel;

  @override
  State<SettingsActionsWidget> createState() => _SettingsActionsWidgetState();
}

class _SettingsActionsWidgetState extends State<SettingsActionsWidget> {
  final TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> changePasswordKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Column(
          children: [
            SettingsItemListTileWidget(
              settingsItemModel: widget.settingsItems[0],
              onTap: () {
                Get.toNamed(GetPages.kEditInfoView);
              },
            ),
            SettingsItemListTileWidget(
              settingsItemModel: widget.settingsItems[1],
              onTap: () {
                customPasswordShowDialog(
                  context: context,
                  changePasswordKey: changePasswordKey,
                  autovalidateMode:
                      context.read<SettingsCubit>().autovalidateMode,
                  onPressed: () async {
                    if (changePasswordKey.currentState!.validate()) {
                      context.read<SettingsCubit>().changeUserPassword(
                            email: emailController.text.trim(),
                          );
                      await Future.delayed(const Duration(seconds: 1));
                      emailController.clear();
                      Get.back();
                    } else {
                      context
                          .read<SettingsCubit>()
                          .changePasswordAutovalidateMode();
                    }
                  },
                  controller: emailController,
                );
              },
            ),
            SettingsItemListTileWidget(
              settingsItemModel: widget.settingsItems[2],
              onTap: () {
                customShowDialog(
                  context: context,
                  title: 'تسجيل الخروج',
                  content: 'هل أنت بالفعل تريد تسجيل الخروج الأن',
                  onPressed: () {
                    context
                        .read<SettingsCubit>()
                        .signOutService(widget.userModel);
                  },
                );
              },
            ),
            SettingsItemListTileWidget(
              settingsItemModel: widget.settingsItems[3],
              onTap: () {
                customShowDialog(
                  context: context,
                  title: 'حذف الحساب',
                  content: 'هل أنت بالفعل تريد حذف الحساب الخاص بك الأن',
                  onPressed: () {
                    context
                        .read<SettingsCubit>()
                        .deleteUserAccount(widget.userModel);
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
