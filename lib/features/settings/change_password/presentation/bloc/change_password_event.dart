// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'change_password_bloc.dart';

@immutable
sealed class ChangePasswordEvent {}

class ChangePassword extends ChangePasswordEvent {
  final ChangePasswordModel changePasswordModel;
  ChangePassword({
    required this.changePasswordModel,
  });
}
