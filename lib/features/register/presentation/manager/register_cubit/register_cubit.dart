import 'dart:io';

import 'package:chat_app/core/model/user_model.dart';
import 'package:chat_app/features/register/data/model/register_user_data.dart';
import 'package:chat_app/features/register/data/register_repo/register_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._registerRepo) : super(RegisterInitial());
  final RegisterRepo _registerRepo;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  changeRegisterAutovalidateMode() {
    autovalidateMode = AutovalidateMode.always;
    emit(RegisterCchangeRegisterAutovalidateMode());
  }

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
      // No image selected
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
      await _registerRepo.sendEmailVerificationLinkToEmail(
        email: userData.email,
        userCredential: userCredential,
      );
      emit(RegisterCubitRegisterUserDataSuccess());
    } catch (e) {
      emit(RegisterCubitRegisterUserDataFailure());
    }
  }
}
