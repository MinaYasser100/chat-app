import 'dart:io';

import 'package:chat_app/features/register/data/register_repo/register_repo.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepo) : super(RegisterInitial());
  final RegisterRepo registerRepo;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  changeRegisterAutovalidateMode() {
    autovalidateMode = AutovalidateMode.always;
    emit(RegisterCchangeRegisterAutovalidateMode());
  }

  String? imageSelected;
  File? profileImage;
  var picker = ImagePicker();
  Future<void> getProfileImage() async {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      uploadImage(profileImage);
      emit(RegisterCubitPickProfileImageSuccess());
    } else {
      emit(RegisterCubitPickProfileImageFailure());
    }
  }

  Future<void> uploadImage(File? image) async {
    if (image == null) {
      // No image selected
      return;
    }
    emit(RegisterCubitImageUploadingLoading());

    try {
      Reference storageReference =
          await registerRepo.uploadImageOnFirebase(image);

      String downloadURL = await storageReference.getDownloadURL();
      imageSelected = downloadURL;
      emit(RegisterCubitImageUploadingSuccess());
    } catch (error) {
      emit(RegisterCubitImageUploadingFailure());
    }
  }
}
