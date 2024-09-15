import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

abstract class RegisterRepo {
  Future<Reference> uploadImageOnFirebase(File image);
}
