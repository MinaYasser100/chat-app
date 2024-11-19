import 'package:chat_app/core/constant/color/app_colors.dart';
import 'package:chat_app/core/helper/func/custom_snackbar_fun.dart';
import 'package:chat_app/core/helper/hive/hive_helper.dart';
import 'package:chat_app/core/helper/model/text_field_model.dart';
import 'package:chat_app/core/helper/pages/get_pages.dart';
import 'package:chat_app/core/helper/validation/email_validator.dart';
import 'package:chat_app/core/helper/widgets/custom_button.dart';
import 'package:chat_app/core/helper/widgets/custom_text_form_field.dart';
import 'package:chat_app/features/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:chat_app/features/setting/presentation/views/func/custom_password_show_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'login_body_no_account.dart';
import 'login_body_section_one.dart';

class LoginBodyView extends StatefulWidget {
  const LoginBodyView({super.key});

  @override
  State<LoginBodyView> createState() => _LoginBodyViewState();
}

class _LoginBodyViewState extends State<LoginBodyView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  GlobalKey<FormState> forgettenPasswordKey = GlobalKey<FormState>();
  TextEditingController forgettenPasswordEmail = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginCubitLoginUserSuccess) {
              HiveHelper.saveUserLogin();
              Get.offAllNamed(GetPages.kHomeView);
              customSnackBar(
                subTitle: 'تم تسجيل الدخول بنجاح, استمتع الان بحدث مع اصدقائك',
                text: 'تسجيل الدخول',
              );
            }
          },
          builder: (context, state) {
            return Form(
              key: loginKey,
              autovalidateMode: context.read<LoginCubit>().autovalidateMode,
              child: Column(
                children: [
                  const LoginBodySectionOne(),
                  CustomTextFormField(
                    textFieldModel: TextFieldModel(
                      periprefixIcon: Icons.email,
                      hintText: 'البريد الالكتروني',
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
                      validator: (password) {
                        if (password!.isEmpty) {
                          return "ادخل كلمة المرور";
                        }
                        return null;
                      },
                    ),
                    isPassword: true,
                  ),
                  TextButton(
                    onPressed: () {
                      customPasswordShowDialog(
                        context: context,
                        changePasswordKey: forgettenPasswordKey,
                        autovalidateMode: context
                            .read<LoginCubit>()
                            .forgettenPasswordAutovalidateMode,
                        onPressed: () async {
                          if (forgettenPasswordKey.currentState!.validate()) {
                            context.read<LoginCubit>().changeUserPassword(
                                  email: forgettenPasswordEmail.text.trim(),
                                );
                            await Future.delayed(const Duration(seconds: 1));
                            forgettenPasswordEmail.clear();
                            Get.back();
                          } else {
                            context
                                .read<LoginCubit>()
                                .changeforgettenPasswordAutovalidateMode();
                          }
                        },
                        controller: forgettenPasswordEmail,
                      );
                    },
                    child: const Text(
                      'نسيت كلمة المرور',
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                  const LoginBodyNoAccount(),
                  CustomButton(
                    text: 'تسجيل الان',
                    onPressed: () {
                      if (loginKey.currentState!.validate()) {
                        context.read<LoginCubit>().loginUser(
                              email: emailController.text.trim(),
                              password: passwordController.text,
                            );
                      } else {
                        context
                            .read<LoginCubit>()
                            .changeLoginAutovalidateMode();
                      }
                    },
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
