import 'package:chat_app/core/constant/color/app_colors.dart';
import 'package:chat_app/core/helper/model/text_field_model.dart';
import 'package:flutter/material.dart';

class CustomHomeTextFormField extends StatelessWidget {
  const CustomHomeTextFormField({
    super.key,
    required this.textFieldModel,
    this.suffixOnTap,
  });
  final TextFieldModel textFieldModel;
  final void Function()? suffixOnTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textFieldModel.controller,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: suffixOnTap,
          icon: Icon(
            textFieldModel.periprefixIcon,
            color: AppColors.primaryColor,
          ),
        ),
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
