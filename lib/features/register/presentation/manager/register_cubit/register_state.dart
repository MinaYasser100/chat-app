part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterCchangeRegisterAutovalidateMode extends RegisterState {}

final class RegisterCubitImageUploadingLoading extends RegisterState {}

final class RegisterCubitImageUploadingSuccess extends RegisterState {}

final class RegisterCubitImageUploadingFailure extends RegisterState {}

final class RegisterCubitPickProfileImageSuccess extends RegisterState {}

final class RegisterCubitPickProfileImageFailure extends RegisterState {}

final class RegisterCubitRegisterUserDataLoading extends RegisterState {}

final class RegisterCubitRegisterUserDataSuccess extends RegisterState {}

final class RegisterCubitRegisterUserDataFailure extends RegisterState {}

final class RegisterCubitEmailVerifiedSuccess extends RegisterState {}

final class RegisterCubitEmailVerificationSent extends RegisterState {}
