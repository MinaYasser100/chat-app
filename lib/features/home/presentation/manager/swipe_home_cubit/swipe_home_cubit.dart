import 'package:chat_app/features/home/presentation/views/widgets/all_users_view.dart';
import 'package:chat_app/features/home/presentation/views/widgets/chat_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'swipe_home_state.dart';

class SwipeHomeCubit extends Cubit<SwipeHomeState> {
  SwipeHomeCubit() : super(SwipeHomeInitial()) {
    activeScreen = screens[0];
  }
  final List<Widget> screens = const [
    ChatHomeScreen(),
    AllUsersView(),
  ];
  late Widget activeScreen;
  void chnageScreen(index) {
    activeScreen = screens[index];
    emit(SwipeHomeChangeScrenn());
  }
}
