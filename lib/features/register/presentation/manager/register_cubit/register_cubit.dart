import 'dart:io';

import 'package:chat_app/core/helper/func/custom_snackbar_fun.dart';
import 'package:chat_app/core/helper/pages/get_pages.dart';
import 'package:chat_app/core/model/user_model.dart';
import 'package:chat_app/features/register/data/model/register_user_data.dart';
import 'package:chat_app/features/register/data/register_repo/register_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._registerRepo) : super(RegisterInitial());
  final RegisterRepo _registerRepo;

  // Autovalidate mode for the form
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  changeRegisterAutovalidateMode() {
    autovalidateMode = AutovalidateMode.always;
    emit(RegisterCchangeRegisterAutovalidateMode());
  }

  // Image selection and upload
  String? imageSelected;
  File? _profileImage;
  final _picker = ImagePicker();

  Future<void> getProfileImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _profileImage = File(pickedFile.path);
      await _uploadImage(_profileImage);
      emit(RegisterCubitPickProfileImageSuccess());
    } else {
      emit(RegisterCubitPickProfileImageFailure());
    }
  }

  Future<void> _uploadImage(File? image) async {
    if (image == null) {
      return;
    }
    emit(RegisterCubitImageUploadingLoading());

    try {
      Reference storageReference =
          await _registerRepo.uploadImageOnFirebase(image);
      String downloadURL = await storageReference.getDownloadURL();
      imageSelected = downloadURL;
      emit(RegisterCubitImageUploadingSuccess());
    } catch (error) {
      emit(RegisterCubitImageUploadingFailure());
    }
  }

  // Register user and upload details to Firebase
  Future<void> registerUser(RegisterUserData userData) async {
    emit(RegisterCubitRegisterUserDataLoading());
    try {
      UserCredential userCredential = await _registerRepo.registerUser(
        email: userData.email,
        password: userData.password,
      );
      await _registerRepo.putUserInformationInFirebase(
        userModel: UserModel(
          name: userData.name,
          email: userData.email,
          image: imageSelected ??
              'https://img.freepik.com/premium-vector/young-man-blue-jacket-is-holding-phone-man-blue-hoodie-is-looking-his-phone_1120557-36228.jpg?w=1060',
          userId: userCredential.user!.uid,
        ),
      );
      await sendEmailVerificationLinkToEmail(
        email: userData.email.trim(),
        userCredential: userCredential,
      );
      emit(RegisterCubitRegisterUserDataSuccess());
    } catch (e) {
      emit(RegisterCubitRegisterUserDataFailure());
    }
  }

  // Sending the email verification link
  Future<void> sendEmailVerificationLinkToEmail({
    required String email,
    required UserCredential userCredential,
  }) async {
    try {
      await userCredential.user!.sendEmailVerification();
      emit(RegisterCubitEmailVerificationSent());

      // Check if the email has been verified
      await checkEmailVerified(userCredential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        customSnackBar(subTitle: 'هذا الايميل ليس موجود', text: 'حساب جديد');
      }
    }
  }

  // Poll to check if the email is verified
  Future<void> checkEmailVerified(UserCredential userCredential) async {
    bool isVerified = false;

    while (!isVerified) {
      try {
        await userCredential.user!.reload(); // Reload user to get updated info
        isVerified = FirebaseAuth.instance.currentUser!.emailVerified;

        print("Email verification status: $isVerified");

        if (isVerified) {
          emit(RegisterCubitEmailVerifiedSuccess());

          customSnackBar(
            subTitle: 'تم تسجيل بيناتك بنجاح',
            text: 'حساب جديد',
          );

          imageSelected = null;
          Get.offNamed(GetPages.kLoginView); // Navigate to login page
          break;
        }
      } catch (e) {
        print("Error checking email verification: $e");
      }

      // Polling every 10 seconds
      await Future.delayed(const Duration(seconds: 10));
    }
  }
}
