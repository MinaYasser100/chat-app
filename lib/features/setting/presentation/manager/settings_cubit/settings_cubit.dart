import 'package:chat_app/core/helper/hive/hive_helper.dart';
import 'package:chat_app/core/helper/pages/get_pages.dart';
import 'package:chat_app/core/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  Future<void> signOutService(UserModel userModel) async {
    emit(SettingsSignOutLoading());
    try {
      EasyLoading.show(status: 'تحميل...');
      await FirebaseAuth.instance.signOut();
      HiveHelper.deleteUserData();
      HiveHelper.singOutUserLogin();
      EasyLoading.dismiss();
      EasyLoading.showSuccess('Successfully sing out');
      Get.offAllNamed(GetPages.kSplashView);
      emit(SettingsSignOutSuccess());
    } catch (e) {
      EasyLoading.showError('Error Occurred, Please Try Again');
      emit(SettingsSignOutFailure());
      return;
    }
  }
}
