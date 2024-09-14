import 'package:chat_app/features/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:chat_app/features/login/presentation/views/widgets/login_body_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: const Scaffold(
        body: LoginBodyView(),
      ),
    );
  }
}
