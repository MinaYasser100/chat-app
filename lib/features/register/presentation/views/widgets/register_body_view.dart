import 'package:chat_app/core/helper/func/custom_snackbar_fun.dart';
import 'package:chat_app/core/helper/model/text_field_model.dart';
import 'package:chat_app/core/helper/validation/email_validator.dart';
import 'package:chat_app/core/helper/widgets/custom_button.dart';
import 'package:chat_app/core/helper/widgets/custom_text_form_field.dart';
import 'package:chat_app/features/register/data/model/register_user_data.dart';
import 'package:chat_app/features/register/presentation/manager/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          child: BlocConsumer<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state is RegisterCubitEmailVerificationSent) {
                customSnackBar(
                  subTitle: 'قوم بتاكيد الايميل لاكمال البيانات',
                  text: 'حساب جديد',
                );
                nameController.clear();
                emailController.clear();
                passwordController.clear();
                confirmPasswordController.clear();
                context.read<RegisterCubit>().imageSelected = null;
              }
              if (state is RegisterCubitRegisterUserDataFailure) {
                nameController.clear();
                emailController.clear();
                passwordController.clear();
                confirmPasswordController.clear();
                context.read<RegisterCubit>().imageSelected = null;
                customSnackBar(
                  subTitle: 'فشلت عملية تسجيل بيناتك',
                  text: 'حساب جديد',
                  color: Colors.red,
                );
              }
            },
            builder: (context, state) {
              return Form(
                key: registerkey,
                autovalidateMode:
                    context.read<RegisterCubit>().autovalidateMode,
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
                        if (registerkey.currentState!.validate()) {
                          context.read<RegisterCubit>().registerUser(
                                RegisterUserData(
                                  name: nameController.text,
                                  email: emailController.text.trim(),
                                  password: passwordController.text,
                                ),
                              );
                        } else {
                          context
                              .read<RegisterCubit>()
                              .changeRegisterAutovalidateMode();
                        }
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
