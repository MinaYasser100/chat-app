part of 'all_users_cubit.dart';

@immutable
sealed class AllUsersState {}

final class AllUsersInitial extends AllUsersState {}

final class AllusersGetUsersDataLoading extends AllUsersState {}

final class AllusersGetUsersDataSuccess extends AllUsersState {
  final List<UserModel> allUsers;

  AllusersGetUsersDataSuccess({required this.allUsers});
}

final class AllusersGetUsersDataFailure extends AllUsersState {
  final String errorMessage;

  AllusersGetUsersDataFailure({required this.errorMessage});
}
