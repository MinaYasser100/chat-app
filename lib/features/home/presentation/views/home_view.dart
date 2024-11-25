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
    return BlocProvider(
      create: (context) => MessagesCubit(),
      child: Scaffold(
        body: BlocBuilder<SwipeHomeCubit, SwipeHomeState>(
          builder: (context, state) => PageView.builder(
            controller: _pageController,
            itemBuilder: (context, index) =>
                context.read<SwipeHomeCubit>().activeScreen,
            onPageChanged: (index) {
              context.read<SwipeHomeCubit>().chnageScreen(index);
            },
            itemCount: context.read<SwipeHomeCubit>().screens.length,
          ),
        ),
      ),
    );
  }
}
