import 'package:chat_app/core/constant/color/app_colors.dart';
import 'package:chat_app/core/constant/styles/styles.dart';
import 'package:chat_app/core/model/user_model.dart';
import 'package:chat_app/features/home/presentation/manager/all_users_cubit/all_users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../func/custom_divider.dart';
import 'custom_user_item_widget.dart';

class AllUsersBodyView extends StatelessWidget {
  const AllUsersBodyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllUsersCubit, AllUsersState>(
      builder: (context, state) {
        if (state is AllusersGetUsersDataLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AllusersGetUsersDataSuccess &&
            state.allUsers.isNotEmpty) {
          List<UserModel> allUsers = state.allUsers;
          return ListView.separated(
            padding: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
            itemBuilder: (context, index) => CustomUserItemWidget(
              userModel: allUsers[index],
            ),
            separatorBuilder: (context, index) => customDivider(),
            itemCount: allUsers.length,
          );
        } else if (state is AllusersGetUsersDataSuccess &&
            state.allUsers.isEmpty) {
          return Center(
            child: Text(
              'لا يوجد اصدقاء لك حتي الان',
              textAlign: TextAlign.center,
              style: Styles.textStyle20.copyWith(color: AppColors.primaryColor),
            ),
          );
        } else {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'لقد حدث خطاء اثناء جلب البيانات',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
