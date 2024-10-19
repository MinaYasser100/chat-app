import 'package:chat_app/core/constant/color/app_colors.dart';
import 'package:chat_app/core/constant/styles/styles.dart';
import 'package:chat_app/features/edit_info/data/repo/edit_info_repo_impl.dart';
import 'package:chat_app/features/edit_info/presentation/manager/edit_info_cubit/edit_info_cubit.dart';
import 'package:chat_app/features/edit_info/presentation/views/widgets/edit_info_body_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditInfoView extends StatelessWidget {
  const EditInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditInfoCubit(EditInfoRepoImpl()),
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: AppColors.primaryColor,
          title: Text(
            'تعديل البيانات',
            style:
                Styles.textStyle24White.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        body: const EditInfoBodyView(),
      ),
    );
  }
}
