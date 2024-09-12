import 'package:chat_app/core/helper/model/text_field_model.dart';
import 'package:chat_app/core/helper/widgets/custom_button.dart';
import 'package:chat_app/core/helper/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../func/register_back_to_login.dart';
import 'register_user_image.dart';

class RegisterBodyView extends StatefulWidget {
  const RegisterBodyView({super.key});

  @override
  State<RegisterBodyView> createState() => _RegisterBodyViewState();
}

class _RegisterBodyViewState extends State<RegisterBodyView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              registerBackToLogin(),
              const RegisterUserImage(),
              const SizedBox(
                height: 30,
              ),
              CustomTextFormField(
                textFieldModel: TextFieldModel(
                  periprefixIcon: Icons.person_outline,
                  hintText: 'الاسم',
                  controller: nameController,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                textFieldModel: TextFieldModel(
                  periprefixIcon: Icons.email,
                  hintText: 'البريد الاكتروني',
                  controller: emailController,
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
                obscureText: true,
                suffixIcon: Icons.visibility_off_outlined,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                textFieldModel: TextFieldModel(
                  periprefixIcon: Icons.lock,
                  hintText: 'تاكيد كلمة المرور',
                  controller: confirmPasswordController,
                ),
                obscureText: true,
                suffixIcon: Icons.visibility_off_outlined,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                text: 'أنشاء حساب',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
