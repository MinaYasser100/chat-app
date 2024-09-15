import 'package:chat_app/core/constant/color/app_colors.dart';
import 'package:chat_app/features/register/presentation/manager/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class RegisterUserImage extends StatelessWidget {
  const RegisterUserImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterCubitImageUploadingLoading) {
          EasyLoading.show(
            status: 'تحميل...',
          );
        }
        if (state is RegisterCubitPickProfileImageSuccess) {
          EasyLoading.dismiss();
          Get.showSnackbar(
            const GetSnackBar(
              backgroundColor: AppColors.primaryColor,
              message: 'تم رفع الصورة بنجاح',
              title: 'نجحت',
              icon: Icon(Icons.check_circle_outline_rounded),
              borderRadius: BorderSide.strokeAlignCenter,
              padding: EdgeInsets.all(20),
              snackPosition: SnackPosition.TOP,
            ),
          );
        }
      },
      builder: (context, state) {
        return Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 104,
              backgroundColor: AppColors.primaryColor,
              child: CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage(
                  context.read<RegisterCubit>().imageSelected ??
                      'https://img.freepik.com/premium-vector/young-man-blue-jacket-is-holding-phone-man-blue-hoodie-is-looking-his-phone_1120557-36228.jpg?w=1060',
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                context.read<RegisterCubit>().getProfileImage();
              },
              icon: const CircleAvatar(
                child: Icon(
                  Icons.edit,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
