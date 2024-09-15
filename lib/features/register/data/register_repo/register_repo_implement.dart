import 'dart:io';

import 'package:chat_app/core/constant/title/titles.dart';
import 'package:chat_app/core/helper/func/custom_snackbar_fun.dart';
import 'package:chat_app/core/model/user_model.dart';
import 'package:chat_app/features/register/data/register_repo/register_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterRepoImplement implements RegisterRepo {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<Reference> uploadImageOnFirebase(File image) async {
    Reference storageReference = _storage
        .ref()
        .child('profile_images/${DateTime.now().millisecondsSinceEpoch}.jpg');

    UploadTask uploadTask = storageReference.putFile(image);

    await uploadTask.whenComplete(() {
      print('Image uploaded successfully!');
    });
    return storageReference;
  }

  @override
  Future<void> putUserInformationInFirebase(
      {required UserModel userModel}) async {
    await _firestore
        .collection(Titles.userCollection)
        .doc()
        .set(userModel.toMap());
  }

  @override
  Future<UserCredential> registerUser(
      {required String email, required String password}) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  @override
  Future<void> sendEmailVerificationLinkToEmail({
    required String email,
    required UserCredential userCredential,
  }) async {
    try {
      await userCredential.user!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // show snakbar user not found
        customSnackBar(subTitle: 'هذا الايميل ليس موجود', text: 'حساب جديد');
      }
    }
  }
}
