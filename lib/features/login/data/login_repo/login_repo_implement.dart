import 'package:chat_app/core/constant/title/titles.dart';
import 'package:chat_app/core/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login_repo.dart';

class LoginRepoImplement implements LoginRepo {
  @override
  Future<UserCredential> loginByEmailAndPassword(
      {required String email, required String password}) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  @override
  Future<String?> getUserIdFromFirebase({required String email}) async {
    var snapshot = await FirebaseFirestore.instance
        .collection(Titles.userCollection)
        .where('email', isEqualTo: email)
        .get();

    if (snapshot.docs.isNotEmpty) {
      return snapshot.docs.first.id;
    } else {
      return null;
    }
  }

  @override
  Future<UserModel?> getUserDataFormFirebase({required String userId}) async {
    UserModel? userModel;
    DocumentSnapshot<Map<String, dynamic>> value = await FirebaseFirestore
        .instance
        .collection(Titles.userCollection)
        .doc(userId)
        .get();
    if (value.exists) {
      userModel = UserModel.fromJson(value.data()!);
    }
    return userModel;
  }
}
