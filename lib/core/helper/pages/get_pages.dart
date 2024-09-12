import 'package:chat_app/features/register/presentation/views/register_view.dart';
import 'package:chat_app/features/splash/presentation/views/splash_view.dart';
import 'package:get/get.dart';

class GetPages {
  static Transition ktransition = Transition.leftToRight;

  static const String kSplashView = '/SplashView';
  static const String kRegisterView = '/RegisterView';

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
  ];
}
