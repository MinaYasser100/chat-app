import 'package:chat_app/core/error/error_handler.dart';
import 'package:chat_app/core/helper/hive/hive_helper.dart';
import 'package:chat_app/core/helper/notification/notification_helper.dart';
import 'package:chat_app/core/helper/pages/get_pages.dart';
import 'package:chat_app/core/model/user_model.dart';
import 'package:chat_app/features/setting/data/repo/settings_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this._settingsRepo) : super(SettingsInitial());

  final SettingsRepo _settingsRepo;

  Future<void> signOutService(UserModel userModel) async {
    emit(SettingsSignOutLoading());
    try {
      if (HiveHelper.getUserLogin()) {
        EasyLoading.show(status: 'تحميل...');
        await FirebaseAuth.instance.signOut();
        HiveHelper.deleteUserData();
        HiveHelper.singOutUserLogin();
        EasyLoading.dismiss();
        EasyLoading.showSuccess('Successfully sing out');
        Get.offAllNamed(GetPages.kSplashView);
        await FirebaseMessaging.instance
            .unsubscribeFromTopic(NotificationHelper().notificationPublicTopic);
        emit(SettingsSignOutSuccess());
      }
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError('Error Occurred, Please Try Again');
      emit(SettingsSignOutFailure());
      return;
    }
  }

  Future<void> deleteUserAccount(UserModel userModel) async {
    emit(SettingsDeleteAccountLoading());
    try {
      if (HiveHelper.getUserLogin()) {
        EasyLoading.show(status: 'تحميل...');
        await _settingsRepo.deleteUserAccount(userModel);
        EasyLoading.showSuccess('Successfully delete account');
        await FirebaseMessaging.instance
            .unsubscribeFromTopic(NotificationHelper().notificationPublicTopic);
        Get.offAllNamed(GetPages.kSplashView);
        emit(SettingsDeleteAccountSuccess());
      }
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError('Error Occurred, Please Try Again');
      emit(SettingsDeleteAccountFailure());
    }
  }

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  void changePasswordAutovalidateMode() {
    autovalidateMode = AutovalidateMode.always;
    emit(SettingsChangePasswordAutovalidateMode());
  }

  void changeUserPassword({required String email}) async {
    emit(SettingsResetUserPasswordLoading());
    try {
      if (HiveHelper.getUserLogin()) {
        FirebaseAuth auth = FirebaseAuth.instance;
        User? currentUser = auth.currentUser;
        if (currentUser != null && currentUser.email == email) {
          await auth.sendPasswordResetEmail(email: email);
          emit(SettingsResetUserPasswordSuccess());
          EasyLoading.showSuccess(
            'انتظر سوف تاتي لك رسالة علي الايميل الخاص بك لتغيير كلمة المرور',
            duration: const Duration(seconds: 5),
          );
        } else {
          emit(SettingsResetUserPasswordFailure());
        }
      }
    } on FirebaseAuthException catch (e) {
      errorHandler(error: e);
    }
  }
}
