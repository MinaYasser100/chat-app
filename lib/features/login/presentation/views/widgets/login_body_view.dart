import 'package:chat_app/core/helper/model/text_field_model.dart';
import 'package:chat_app/core/helper/validation/email_validator.dart';
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
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Form(
          key: loginKey,
          child: Column(
            children: [
              const LoginBodySectionOne(),
              CustomTextFormField(
                textFieldModel: TextFieldModel(
                  periprefixIcon: Icons.email,
                  hintText: 'البريد الالكتروني',
                  controller: eamilController,
                  validator: (email) => validateEmail(email),
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
                  validator: (password) {
                    if (password!.isEmpty) {
                      return "ادخل كلمة المرور";
                    }
                    return null;
                  },
                ),
                obscureText: true,
                suffixIcon: Icons.visibility_off_outlined,
              ),
              const LoginBodyNoAccount(),
              CustomButton(
                text: 'تسجيل الان',
                onPressed: () {
                  if (loginKey.currentState!.validate()) {}
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
