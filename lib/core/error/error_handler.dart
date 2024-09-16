import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'show_dialog_change_password.dart';

void errorHandler({required Exception error, BuildContext? context}) {
  String message;

  if (error is FirebaseAuthException) {
    switch (error.code) {
      case 'weak-password':
        message = 'The password provided is too weak.';
        break;
      case 'invalid-credential':
        message = 'The password Or Email Wrong.';
        break;
      case 'invalid-email':
        message = 'The email provided is invalid.';
        break;
      case 'user-not-found':
        message = 'No user found for the provided email.';
        break;
      case 'wrong-password':
        message = 'Wrong password.';
        break;
      case 'too-many-requests':
        message = 'Too many requests, Try again after some time.';
        break;
      case 'account-exists-with-different-credential':
        message = 'Account exists with different credential.';
        break;
      case 'email-already-in-use':
        message = 'Email already in use.';
        break;
      case 'operation-not-allowed':
        message = 'Operation not allowed.';
        break;
      case 'user-disabled':
        message = 'User disabled.';
        break;
      case 'requires-recent-login':
        message = 'Requires recent login.';
        break;
      default:
        message = error.message ?? 'An error occurred, please try again later.';
        break;
    }
  } else if (error is TimeoutException) {
    message = 'The operation timed out. Please try again.';
  } else if (error is SocketException) {
    message = 'No internet connection. Please check your network settings.';
  } else if (error is FormatException) {
    message = 'Invalid data format.';
  } else {
    message = error.toString();
  }

  if (context != null) {
    showDialogChangePassword(
      context: context,
      title: 'Error'.tr,
      content: message.tr,
    );
  } else {
    EasyLoading.showError(message.tr);
    Future.delayed(const Duration(seconds: 4), () {
      EasyLoading.dismiss();
    });
  }
}
