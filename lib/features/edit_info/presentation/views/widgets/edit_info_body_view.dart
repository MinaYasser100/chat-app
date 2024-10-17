import 'package:chat_app/core/constant/color/app_colors.dart';
import 'package:chat_app/core/helper/hive/hive_helper.dart';
import 'package:chat_app/core/helper/model/text_field_model.dart';
import 'package:chat_app/core/helper/widgets/custom_text_form_field.dart';
import 'package:chat_app/core/helper/widgets/custom_user_image.dart';
import 'package:chat_app/core/model/user_model.dart';
import 'package:flutter/material.dart';

class EditInfoBodyView extends StatefulWidget {
  const EditInfoBodyView({super.key});

  @override
  State<EditInfoBodyView> createState() => _EditInfoBodyViewState();
}

class _EditInfoBodyViewState extends State<EditInfoBodyView> {
  UserModel userModel = HiveHelper.getUserData();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  void initState() {
    nameController.text = userModel.name;
    emailController.text = userModel.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CustomUserImage(image: userModel.image),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, right: 10),
                  child: IconButton(
                    onPressed: () {},
                    icon: const CircleAvatar(
                      radius: 24,
                      backgroundColor: AppColors.primaryColor,
                      child: Icon(
                        Icons.change_circle_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextFormField(
              textFieldModel: TextFieldModel(
                periprefixIcon: Icons.person,
                hintText: 'الاسم',
                controller: nameController,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              textFieldModel: TextFieldModel(
                periprefixIcon: Icons.email_rounded,
                hintText: 'الايميل',
                controller: emailController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
