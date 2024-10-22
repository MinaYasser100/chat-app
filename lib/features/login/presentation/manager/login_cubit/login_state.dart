part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginChangeLoginAutovalidateMode extends LoginState {}

final class LoginCubitLoginUserLoading extends LoginState {}

final class LoginCubitLoginUserSuccess extends LoginState {}

final class LoginCubitLoginUserFailure extends LoginState {}

final class LoginCubitForgettenPasswordLoading extends LoginState {}

final class LoginCubitForgettenPasswordSuccess extends LoginState {}

final class LoginCubitForgettenPasswordFailure extends LoginState {}
