part of 'edit_info_cubit.dart';

@immutable
sealed class EditInfoState {}

final class EditInfoInitial extends EditInfoState {}

final class EditInfoCubitPickProfileImageSuccess extends EditInfoState {}

final class EditInfoCubitPickProfileImageFailure extends EditInfoState {}

final class EditInfoCubitImageUploadingLoading extends EditInfoState {}

final class EditInfoCubitImageUploadingSuccess extends EditInfoState {}

final class EditInfoCubitImageUploadingFailure extends EditInfoState {}

final class EditInfoCubitUpdateUserDataLoading extends EditInfoState {}

final class EditInfoCubitUpdateUserDataSuccess extends EditInfoState {}

final class EditInfoCubitUpdateUserDataFailure extends EditInfoState {}
