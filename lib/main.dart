import 'package:chat_app/core/constant/color/app_colors.dart';
import 'package:chat_app/core/helper/hive/hive_helper.dart';
import 'package:chat_app/core/helper/pages/get_pages.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await HiveHelper.initHive();
  initializeDateFormatting('ar', null).then((_) {
    runApp(const MyApp());
  });
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    await Firebase.initializeApp();
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
    await Firebase.initializeApp();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale('ar'),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: GetPages.kSplashView,
      getPages: GetPages.getPages,
      builder: EasyLoading.init(),
    );
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  await Hive.initFlutter();
}

// void _saveNotificationToHive(RemoteMessage message, Box box) async {
//   NotificationModel notification = NotificationModel(
//     title: message.notification?.title,
//     body: message.notification?.body,
//     receivedAt: DateTime.now().toString(),
//     readed: false,
//     key: message.messageId,
//   );
//   box.put(notification.key, notification);
// }
