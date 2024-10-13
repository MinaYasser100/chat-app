import 'package:flutter/material.dart';

class SettingsItemModel {
  final String title;
  final IconData leadingIcon;
  final IconData trailing;
  final void Function() onTap;

  const SettingsItemModel({
    required this.title,
    required this.leadingIcon,
    required this.trailing,
    required this.onTap,
  });
}
