import 'dart:io';

import 'package:chat_app/features/edit_info/data/repo/edit_info_repo.dart';
import 'package:firebase_storage/firebase_storage.dart';

class EditInfoRepoImpl implements EditInfoRepo {
  final FirebaseStorage _storage = FirebaseStorage.instance;
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
}
