import 'package:chat_app/core/error/error_handler.dart';
import 'package:chat_app/core/helper/hive/hive_helper.dart';
import 'package:chat_app/core/model/user_model.dart';
import 'package:chat_app/features/login/data/login_repo/login_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo) : super(LoginInitial());
  final LoginRepo _loginRepo;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  changeLoginAutovalidateMode() {
    autovalidateMode = AutovalidateMode.always;
    emit(LoginChangeLoginAutovalidateMode());
  }

  AutovalidateMode forgettenPasswordAutovalidateMode =
      AutovalidateMode.disabled;
  changeforgettenPasswordAutovalidateMode() {
    forgettenPasswordAutovalidateMode = AutovalidateMode.always;
    emit(LoginChangeLoginAutovalidateMode());
  }

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    emit(LoginCubitLoginUserLoading());
    EasyLoading.show(
      status: 'جاري التسجيل الدخول...',
    );
    try {
      UserCredential userCredential = await _loginRepo.loginByEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel? userModel;
      if (userCredential.user != null) {
        userModel = await _loginRepo.getUserDataFormFirebase(
            userId: userCredential.user!.uid);
      }
      if (userModel != null) await HiveHelper.saveUserData(userModel);
      EasyLoading.dismiss();
      emit(LoginCubitLoginUserSuccess());
    } on Exception catch (e) {
      errorHandler(error: e);
      EasyLoading.dismiss();
      emit(LoginCubitLoginUserFailure());
    }
  }

  void changeUserPassword({required String email}) async {
    emit(LoginCubitForgettenPasswordLoading());
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      await auth.sendPasswordResetEmail(email: email);
      emit(LoginCubitForgettenPasswordSuccess());
      EasyLoading.showSuccess(
        'انتظر سوف تاتي لك رسالة علي الايميل الخاص بك لتغيير كلمة المرور',
        duration: const Duration(seconds: 5),
      );
    } on FirebaseAuthException catch (e) {
      errorHandler(error: e);
      emit(LoginCubitForgettenPasswordFailure());
    }
  }
}
