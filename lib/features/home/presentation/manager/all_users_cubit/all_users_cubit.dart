import 'package:chat_app/core/constant/title/titles.dart';
import 'package:chat_app/core/error/error_handler.dart';
import 'package:chat_app/core/helper/hive/hive_helper.dart';
import 'package:chat_app/core/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'all_users_state.dart';

class AllUsersCubit extends Cubit<AllUsersState> {
  AllUsersCubit() : super(AllUsersInitial());

  Future<void> getAllUsersData() async {
    emit(AllusersGetUsersDataLoading());
    try {
      QuerySnapshot response = await FirebaseFirestore.instance
          .collection(Titles.userCollection)
          .get();

      List<UserModel> allUsers = response.docs
          .where((doc) =>
              (doc.data() as Map<String, dynamic>)['email'] !=
              HiveHelper.getUserData().email)
          .map((doc) => UserModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      emit(AllusersGetUsersDataSuccess(allUsers: allUsers));
    } on Exception catch (e) {
      errorHandler(error: e);
      emit(AllusersGetUsersDataFailure(errorMessage: e.toString()));
    }
  }
}
