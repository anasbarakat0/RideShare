// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'change_password_bloc.dart';

@immutable
sealed class ChangePasswordState {}

final class ChangePasswordInitial extends ChangePasswordState {}

class SuccessChanging extends ChangePasswordState {
  final String message;
  SuccessChanging({
    required this.message,
  });
}

class BadRequestChanging extends ChangePasswordState {
  final BadRequest badRequest;
  BadRequestChanging({
    required this.badRequest,
  });
}

class ErrorChanging extends ChangePasswordState {}

class ExceptionChanging extends ChangePasswordState {}

class LoadingChanging extends ChangePasswordState {}
