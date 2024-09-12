import 'package:chat_app/core/constant/color/app_colors.dart';
import 'package:flutter/material.dart';

AppBar customAppBar() {
  return AppBar(
    // Remove the backgroundColor as we are using a gradient instead
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        // Apply a linear gradient with two colors
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor,
            AppColors.secondColor,
            Color.fromARGB(255, 189, 217, 239)
          ], // Your two colors
          begin: Alignment.topRight,
          end: Alignment.topLeft,
        ),
      ),
    ),
    title: const Text(
      'دردشة',
      style: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: Colors.white, // Set the text color to white
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  );
}
