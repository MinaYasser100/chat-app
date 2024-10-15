import 'package:flutter/material.dart';

class SettingsItemModel {
  final String title;
  final IconData leadingIcon;
  final IconData trailing;

  const SettingsItemModel({
    required this.title,
    required this.leadingIcon,
    required this.trailing,
  });
}
