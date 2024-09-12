import 'package:chat_app/features/login/presentation/views/widgets/login_body_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginBodyView(),
    );
  }
}
