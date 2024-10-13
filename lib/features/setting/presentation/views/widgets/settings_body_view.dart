import 'package:chat_app/core/constant/color/app_colors.dart';
import 'package:chat_app/core/constant/styles/styles.dart';
import 'package:chat_app/core/helper/hive/hive_helper.dart';
import 'package:chat_app/core/model/user_model.dart';
import 'package:flutter/material.dart';

class SettingsBodyView extends StatelessWidget {
  const SettingsBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel userModel = HiveHelper.getUserData();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          width: double.infinity,
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 102,
            child: CircleAvatar(
              radius: 97,
              backgroundImage: NetworkImage(userModel.image),
            ),
          ),
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
        ListTile(
          leading: const Icon(Icons.edit),
          onTap: () {},
          iconColor: AppColors.primaryColor,
          title: const Text(
            'تعديل البيانات',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          onTap: () {},
          iconColor: AppColors.primaryColor,
          title: const Text(
            'تسجيل الخروج',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
        ),
        ListTile(
          leading: const Icon(Icons.delete_rounded),
          onTap: () {},
          iconColor: AppColors.primaryColor,
          title: const Text(
            'حذف الحساب',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
        ),
      ],
    );
  }
}
