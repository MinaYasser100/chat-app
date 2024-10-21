import 'dart:io';

import 'package:chat_app/core/model/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class EditInfoRepo {
  Future<Reference> uploadImageOnFirebase(File image);
  Future<void> changeUserInfoInAllMessage(UserModel updateUserModel);
}
