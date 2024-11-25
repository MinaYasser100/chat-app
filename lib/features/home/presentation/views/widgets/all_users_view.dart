import 'package:flutter/material.dart';
import '../func/custom_all_users_app_bar.dart';

class AllUsersView extends StatelessWidget {
  const AllUsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAllUsersAppBar(),
      body: const Column(
        children: [],
      ),
    );
  }
}
