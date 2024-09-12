import 'package:chat_app/features/splash/presentation/views/splash_view.dart';
import 'package:get/get.dart';

class GetPages {
  static Transition ktransition = Transition.leftToRight;

  static const String kSplashView = '/SplashView';

  static List<GetPage<dynamic>> getPages = [
    GetPage(
      name: kSplashView,
      page: () => const SplashView(),
      transition: ktransition,
    ),
  ];
}
