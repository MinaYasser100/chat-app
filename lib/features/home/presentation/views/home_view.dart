import 'package:chat_app/features/home/presentation/manager/all_users_cubit/all_users_cubit.dart';
import 'package:chat_app/features/home/presentation/manager/messages_cubit/messages_cubit.dart';
import 'package:chat_app/features/home/presentation/manager/swipe_home_cubit/swipe_home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SwipeHomeCubit(), // Add SwipeHomeCubit here
        ),
        BlocProvider(
          create: (context) => MessagesCubit(),
        ),
        BlocProvider(
          create: (context) => AllUsersCubit()..getAllUsersData(),
        ),
      ],
      child: Scaffold(
        body: BlocBuilder<SwipeHomeCubit, SwipeHomeState>(
          builder: (context, state) {
            final swipeCubit =
                context.read<SwipeHomeCubit>(); // Safely access cubit
            return PageView.builder(
              controller: _pageController,
              itemBuilder: (context, index) => swipeCubit.activeScreen,
              onPageChanged: (index) {
                swipeCubit.chnageScreen(index); // Emit state safely
              },
              itemCount: swipeCubit.screens.length,
            );
          },
        ),
      ),
    );
  }
}
