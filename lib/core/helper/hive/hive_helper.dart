import 'package:chat_app/core/constant/title/titles.dart';
import 'package:chat_app/core/model/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper {
  static Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserModelAdapter());
    await Hive.openBox<UserModel>(Titles.userModelHive);
    await Hive.openBox<bool>(Titles.checkHive);
  }

  static Future<void> saveUserData(UserModel userModel) async {
    var box = Hive.box<UserModel>(Titles.userModelHive);
    await box.add(userModel);
  }

  static UserModel getUserData() {
    var userBox = Hive.box<UserModel>(Titles.userModelHive);
    UserModel? user = userBox.values.first;
    return user;
  }

  static void deleteUserData() {
    var box = Hive.box<UserModel>(Titles.userModelHive);
    box.clear();
  }

  static void saveUserLogin() async {
    var box = Hive.box<bool>(Titles.checkHive);
    await box.put(Titles.loginCheckHive, true);
  }

  static bool getUserLogin() {
    var box = Hive.box<bool>(Titles.checkHive);
    bool check = box.get(Titles.loginCheckHive, defaultValue: false) ?? false;
    return check;
  }
}
