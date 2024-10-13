import 'package:chat_app/features/edit_info/presentation/views/edit_info_view.dart';
import 'package:chat_app/features/home/presentation/views/home_view.dart';
import 'package:chat_app/features/login/presentation/views/login_view.dart';
import 'package:chat_app/features/register/presentation/views/register_view.dart';
import 'package:chat_app/features/setting/presentation/views/settings_view.dart';
import 'package:chat_app/features/splash/presentation/views/splash_view.dart';
import 'package:get/get.dart';

class GetPages {
  static Transition ktransition = Transition.leftToRight;

  static const String kSplashView = '/SplashView';
  static const String kRegisterView = '/RegisterView';
  static const String kLoginView = '/LoginView';
  static const String kHomeView = '/HomeView';
  static const String kSettingView = '/SettingView';
  static const String kEditInfoView = '/EditInfoView';

  static List<GetPage<dynamic>> getPages = [
    GetPage(
      name: kSplashView,
      page: () => const SplashView(),
      transition: ktransition,
    ),
    GetPage(
      name: kRegisterView,
      page: () => const RegisterView(),
      transition: ktransition,
    ),
    GetPage(
      name: kLoginView,
      page: () => const LoginView(),
      transition: ktransition,
    ),
    GetPage(
      name: kHomeView,
      page: () => const HomeView(),
      transition: ktransition,
    ),
    GetPage(
      name: kSettingView,
      page: () => const SettingsView(),
      transition: ktransition,
    ),
    GetPage(
      name: kEditInfoView,
      page: () => const EditInfoView(),
      transition: ktransition,
    ),
  ];
}
