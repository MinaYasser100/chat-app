import 'package:hive_flutter/hive_flutter.dart';
import 'package:chat_app/core/model/message_model.dart';
import 'package:chat_app/core/model/user_model.dart';
import 'package:chat_app/core/constant/title/titles.dart';

class HiveHelper {
  static Future<void> initHive() async {
    await Hive.initFlutter();

    // Register the adapters for both UserModel and MessageModel
    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(MessageModelAdapter());

    // Open boxes
    await Hive.openBox<UserModel>(Titles.userModelHive);
    await Hive.openBox<MessageModel>(Titles.messagesModelHiveBox);
    await Hive.openBox<bool>(Titles.checkHive);
  }

  // Save and retrieve data
  // Save a message to Hive
  static Future<void> saveMessage(MessageModel message) async {
    var box = Hive.box<MessageModel>(Titles.messagesModelHiveBox);
    await box.add(message);
  }

  // Retrieve all messages from Hive
  static List<MessageModel> getMessages() {
    var box = Hive.box<MessageModel>(Titles.messagesModelHiveBox);
    return box.values.toList();
  }

  // Clear all messages from the Hive box
  static Future<void> clearMessages() async {
    var box = Hive.box<MessageModel>(Titles.messagesModelHiveBox);
    await box.clear(); // This will delete all stored messages in the box
  }

  static Future<void> saveUserData(UserModel userModel) async {
    var box = Hive.box<UserModel>(Titles.userModelHive);
    await box.add(userModel);
  }

  static UserModel getUserData() {
    var userBox = Hive.box<UserModel>(Titles.userModelHive);
    return userBox.values.first;
  }

  static void deleteUserData() async {
    var box = Hive.box<UserModel>(Titles.userModelHive);
    await box.clear();
  }

  static void saveUserLogin() async {
    var box = Hive.box<bool>(Titles.checkHive);
    await box.put(Titles.loginCheckHive, true);
  }

  static bool getUserLogin() {
    var box = Hive.box<bool>(Titles.checkHive);
    return box.get(Titles.loginCheckHive, defaultValue: false) ?? false;
  }

  static void singOutUserLogin() async {
    var box = Hive.box<bool>(Titles.checkHive);
    await box.put(Titles.loginCheckHive, false);
  }

  static Future<void> updateUserDataInHive(UserModel updatedUserModel) async {
    var userBox = Hive.box<UserModel>(Titles.userModelHive);
    await userBox.clear();
    await userBox.add(updatedUserModel);
  }
}
