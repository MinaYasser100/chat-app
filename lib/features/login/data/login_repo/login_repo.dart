import 'package:chat_app/core/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRepo {
  Future<UserCredential> loginByEmailAndPassword({
    required String email,
    required String password,
  });

  Future<String?> getUserIdFromFirebase({required String email});

  Future<UserModel?> getUserDataFormFirebase({required String userId});
}
