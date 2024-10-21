import 'dart:io';

import 'package:chat_app/core/constant/title/titles.dart';
import 'package:chat_app/core/error/error_handler.dart';
import 'package:chat_app/core/model/user_model.dart';
import 'package:chat_app/features/edit_info/data/repo/edit_info_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class EditInfoRepoImpl implements EditInfoRepo {
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
  Future<void> changeUserInfoInAllMessage(UserModel updateUserModel) async {
    try {
      var data = _firestore.collection(Titles.messages);
      // Get all messages where the sender userId matches the updated userId
      QuerySnapshot querySnapshot = await data
          .where('sender.email', isEqualTo: updateUserModel.email)
          .get();
      // Use batch write to update multiple documents efficiently
      WriteBatch batch = _firestore.batch();

      for (var doc in querySnapshot.docs) {
        batch.update(doc.reference, {
          'sender.name': updateUserModel.name,
          'sender.email': updateUserModel.email,
          'sender.image': updateUserModel.image,
        });
      }
      // Commit the batch update
      await batch.commit();
    } on Exception catch (e) {
      errorHandler(error: e);
    }
  }
}
