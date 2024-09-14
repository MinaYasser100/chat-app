import 'package:chat_app/core/helper/model/text_field_model.dart';
import 'package:chat_app/core/helper/validation/email_validator.dart';
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
  GlobalKey<FormState> registerkey = GlobalKey<FormState>();
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: registerkey,
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
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'لا يجب تارك خانه الاسم فارغة';
                      }
                      return null;
                    },
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
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'لا يجب تارك خانة كلمة المرور فارغة';
                      }
                      return null;
                    },
                  ),
                  isPassword: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  textFieldModel: TextFieldModel(
                    periprefixIcon: Icons.lock,
                    hintText: 'تاكيد كلمة المرور',
                    controller: confirmPasswordController,
                    validator: (p0) {
                      if (confirmPasswordController.text !=
                          passwordController.text) {
                        return 'كلمة المرور خاطئة';
                      }
                      return null;
                    },
                  ),
                  isPassword: true,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  text: 'أنشاء حساب',
                  onPressed: () {
                    if (registerkey.currentState!.validate()) {}
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
