import 'package:chat_app/core/helper/model/text_field_model.dart';
import 'package:chat_app/core/helper/widgets/custom_button.dart';
import 'package:chat_app/core/helper/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import 'login_body_no_account.dart';
import 'login_body_section_one.dart';

class LoginBodyView extends StatefulWidget {
  const LoginBodyView({super.key});

  @override
  State<LoginBodyView> createState() => _LoginBodyViewState();
}

class _LoginBodyViewState extends State<LoginBodyView> {
  TextEditingController eamilController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const LoginBodySectionOne(),
          CustomTextFormField(
            textFieldModel: TextFieldModel(
              periprefixIcon: Icons.email,
              hintText: 'البريد الالكتروني',
              controller: eamilController,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            textFieldModel: TextFieldModel(
              periprefixIcon: Icons.lock,
              hintText: 'كلمة المرور',
              controller: passwordController,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const LoginBodyNoAccount(),
          const SizedBox(
            height: 30,
          ),
          CustomButton(
            text: 'تسجيل الان',
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
