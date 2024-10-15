import 'package:chat_app/core/constant/title/titles.dart';
import 'package:chat_app/core/helper/hive/hive_helper.dart';
import 'package:chat_app/core/model/user_model.dart';
import 'package:chat_app/features/setting/data/repo/settings_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsRepoImpl implements SettingsRepo {
  @override
  Future<void> deleteUserAccount(UserModel userModel) async {
    await FirebaseAuth.instance.currentUser!.delete();
    await FirebaseFirestore.instance
        .collection(Titles.userCollection)
        .doc(userModel.userId)
        .delete();
    HiveHelper.deleteUserData();
    HiveHelper.singOutUserLogin();
  }
}
