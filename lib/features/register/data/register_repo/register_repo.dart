import 'dart:io';

import 'package:chat_app/core/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class RegisterRepo {
  Future<Reference> uploadImageOnFirebase(File image);
  Future<void> putUserInformationInFirebase({
    required UserModel userModel,
  });
  Future<UserCredential> registerUser(
      {required String email, required String password});
  Future<void> sendEmailVerificationLinkToEmail({
    required String email,
    required UserCredential userCredential,
  });
}
