import 'package:flutter/material.dart';

class TextFieldModel {
  final IconData periprefixIcon;
  final String hintText;
  final TextEditingController controller;
  TextFieldModel({
    required this.periprefixIcon,
    required this.hintText,
    required this.controller,
  });
}
