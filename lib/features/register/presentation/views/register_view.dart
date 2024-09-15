import 'package:chat_app/features/register/data/register_repo/register_repo_implement.dart';
import 'package:chat_app/features/register/presentation/manager/register_cubit/register_cubit.dart';
import 'package:chat_app/features/register/presentation/views/widgets/register_body_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(RegisterRepoImplement()),
      child: const Scaffold(
        body: RegisterBodyView(),
      ),
    );
  }
}
