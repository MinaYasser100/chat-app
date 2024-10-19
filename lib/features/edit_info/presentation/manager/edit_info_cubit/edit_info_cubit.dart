import 'dart:io';

import 'package:chat_app/core/helper/func/custom_snackbar_fun.dart';
import 'package:chat_app/features/edit_info/data/repo/edit_info_repo.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';

part 'edit_info_state.dart';

class EditInfoCubit extends Cubit<EditInfoState> {
  EditInfoCubit(this._editInfoRepo) : super(EditInfoInitial());

  final EditInfoRepo _editInfoRepo;
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
      emit(EditInfoCubitPickProfileImageSuccess());
    } else {
      emit(EditInfoCubitPickProfileImageFailure());
    }
  }

  Future<void> _uploadImage(File? image) async {
    EasyLoading.show(status: 'جاري التحميل...');
    if (image == null) {
      return;
    }
    emit(EditInfoCubitImageUploadingLoading());

    try {
      Reference storageReference =
          await _editInfoRepo.uploadImageOnFirebase(image);
      String downloadURL = await storageReference.getDownloadURL();
      imageSelected = downloadURL;
      EasyLoading.dismiss();
      EasyLoading.showSuccess('تم تحميل الصورة بنجاح',
          duration: const Duration(seconds: 1));
      emit(EditInfoCubitImageUploadingSuccess());
    } catch (error) {
      emit(EditInfoCubitImageUploadingFailure());
      customSnackBar(
        subTitle: 'حدث خطاء اثناء تحميل الصوره',
        text: 'خطاء',
        color: Colors.red,
      );
    }
  }
}
