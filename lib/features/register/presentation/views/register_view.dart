import 'package:chat_app/features/register/presentation/views/widgets/register_body_view.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RegisterBodyView(),
    );
  }
}
