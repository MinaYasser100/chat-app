import 'package:chat_app/core/constant/color/app_colors.dart';
import 'package:chat_app/core/constant/styles/styles.dart';
import 'package:chat_app/core/helper/model/text_field_model.dart';
import 'package:chat_app/core/helper/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> customPasswordShowDialog({
  required BuildContext context,
  required void Function() onPressed,
  required TextEditingController controller,
  required GlobalKey<FormState> changePasswordKey,
  required AutovalidateMode autovalidateMode,
}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: AppColors.secondColor,
      title: Text(
        'تغيير كلمة المرور',
        style: Styles.textStyle24White.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Form(
        key: changePasswordKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            const Text(
              'ادخل الايميل الخاص بك لتغيير كلمة المرور الخاصة بك ',
              style: Styles.textStyle16Black,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              iconColor: Colors.white,
              textFieldModel: TextFieldModel(
                  controller: controller,
                  hintText: 'الايميل الخاص بك',
                  periprefixIcon: Icons.email_rounded,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "من فضلك أدخل الايميل الخاص بك";
                    } else if (!value.contains('@')) {
                      return 'الايميل يجب ان يحتوي علي @';
                    }
                    return null;
                  }),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: onPressed,
          child: Text(
            'أرسال',
            style: Styles.textStyle18Gray.copyWith(
              color: AppColors.secondColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            'ألغاء',
            style: Styles.textStyle18Gray.copyWith(
              color: AppColors.secondColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    ),
  );
}
