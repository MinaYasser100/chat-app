import 'package:chat_app/core/constant/color/app_colors.dart';
import 'package:chat_app/core/helper/hive/hive_helper.dart';
import 'package:chat_app/core/helper/model/text_field_model.dart';
import 'package:chat_app/core/helper/pages/get_pages.dart';
import 'package:chat_app/core/helper/widgets/custom_button.dart';
import 'package:chat_app/core/helper/widgets/custom_text_form_field.dart';
import 'package:chat_app/core/helper/widgets/custom_user_image.dart';
import 'package:chat_app/core/model/user_model.dart';
import 'package:chat_app/features/edit_info/presentation/manager/edit_info_cubit/edit_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

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
        child: BlocConsumer<EditInfoCubit, EditInfoState>(
          listener: (context, state) {
            if (state is EditInfoCubitUpdateUserDataSuccess) {
              Get.offAllNamed(GetPages.kHomeView);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CustomUserImage(
                          image: context.read<EditInfoCubit>().imageSelected ??
                              userModel.image),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10, right: 10),
                        child: IconButton(
                          onPressed: () {
                            context.read<EditInfoCubit>().getProfileImage();
                          },
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
                    readOnly: true,
                    textFieldModel: TextFieldModel(
                      periprefixIcon: Icons.email_rounded,
                      hintText: 'الايميل',
                      controller: emailController,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                      text: 'تعديل',
                      onPressed: () {
                        context
                            .read<EditInfoCubit>()
                            .updateUserData(userName: nameController.text);
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
