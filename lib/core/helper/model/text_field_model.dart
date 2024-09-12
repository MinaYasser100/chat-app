import 'package:flutter/material.dart';

class TextFieldModel {
  final IconData periprefixIcon;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  TextFieldModel({
    required this.periprefixIcon,
    required this.hintText,
    required this.controller,
    required this.validator,
  });
}
