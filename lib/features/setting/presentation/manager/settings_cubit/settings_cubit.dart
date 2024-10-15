import 'package:chat_app/core/helper/hive/hive_helper.dart';
import 'package:chat_app/core/helper/pages/get_pages.dart';
import 'package:chat_app/core/model/user_model.dart';
import 'package:chat_app/features/setting/data/repo/settings_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this.settingsRepo) : super(SettingsInitial());
  final SettingsRepo settingsRepo;
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
        await settingsRepo.deleteUserAccount(userModel);
        EasyLoading.showSuccess('Successfully delete account');
        Get.offAllNamed(GetPages.kSplashView);
        emit(SettingsDeleteAccountSuccess());
      }
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError('Error Occurred, Please Try Again');
      emit(SettingsDeleteAccountFailure());
    }
  }
}
