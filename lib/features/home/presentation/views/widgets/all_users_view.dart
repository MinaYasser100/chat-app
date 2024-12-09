import 'package:flutter/material.dart';
import '../func/custom_all_users_app_bar.dart';
import 'all_users_body_view.dart';

class AllUsersView extends StatelessWidget {
  const AllUsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAllUsersAppBar(),
      body: const AllUsersBodyView(),
    );
  }
}
