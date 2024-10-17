import 'package:chat_app/core/constant/color/app_colors.dart';
import 'package:chat_app/core/helper/model/text_field_model.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.textFieldModel,
    this.isPassword = false,
    this.iconColor = AppColors.primaryColor,
  });
  final TextFieldModel textFieldModel;
  final bool isPassword;
  final Color iconColor;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textFieldModel.controller,
      obscureText: widget.isPassword ? isObscureText : false,
      validator: widget.textFieldModel.validator,
      decoration: InputDecoration(
        prefixIcon: Icon(
          widget.textFieldModel.periprefixIcon,
          color: widget.iconColor,
        ),
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  isObscureText = !isObscureText;
                  setState(() {});
                },
                child: Icon(
                  isObscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
              )
            : null,
        hintText: widget.textFieldModel.hintText,
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
      borderSide: BorderSide(color: widget.iconColor),
    );
  }
}
