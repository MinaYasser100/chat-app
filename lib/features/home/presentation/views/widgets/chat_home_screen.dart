import 'package:chat_app/features/home/presentation/views/func/custom_home_app_bar.dart';
import 'package:chat_app/features/home/presentation/views/widgets/home_body_view.dart';
import 'package:flutter/material.dart';

class ChatHomeScreen extends StatelessWidget {
  const ChatHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customHomeAppBar(),
      body: const HomeBodyView(),
    );
  }
}
