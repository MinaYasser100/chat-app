import 'package:chat_app/core/constant/color/app_colors.dart';
import 'package:chat_app/core/helper/model/text_field_model.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.textFieldModel,
    this.obscureText = false,
    this.suffixIcon,
  });
  final TextFieldModel textFieldModel;
  final bool obscureText;
  final IconData? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textFieldModel.controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(
          textFieldModel.periprefixIcon,
          color: AppColors.primaryColor,
        ),
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : const SizedBox(),
        hintText: textFieldModel.hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        border: customOutLineInputBorder(),
        enabledBorder: customOutLineInputBorder(),
        focusedBorder: customOutLineInputBorder(),
        errorBorder: customOutLineInputBorder(),
        disabledBorder: customOutLineInputBorder(),
      ),
    );
  }

  OutlineInputBorder customOutLineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: AppColors.primaryColor),
    );
  }
}
