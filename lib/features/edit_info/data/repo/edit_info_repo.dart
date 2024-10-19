import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

abstract class EditInfoRepo {
  Future<Reference> uploadImageOnFirebase(File image);
}
