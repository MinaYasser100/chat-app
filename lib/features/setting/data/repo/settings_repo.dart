import 'package:chat_app/core/model/user_model.dart';

abstract class SettingsRepo {
  Future<void> deleteUserInfoFirebase(UserModel userModel);
}
