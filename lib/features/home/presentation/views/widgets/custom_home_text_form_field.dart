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
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: suffixOnTap,
          icon: Icon(
            textFieldModel.periprefixIcon,
            color: Colors.white,
          ),
        ),
        hintText: textFieldModel.hintText,
        hintStyle: const TextStyle(
          color: Colors.white,
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
      borderSide: const BorderSide(color: Colors.white),
    );
  }
}
