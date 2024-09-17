import 'package:chat_app/features/home/presentation/views/widgets/home_body_view.dart';
import 'package:flutter/material.dart';

import 'func/custom_home_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customHomeAppBar(),
      body: const HomeBodyView(),
    );
  }
}
