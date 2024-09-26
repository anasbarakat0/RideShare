// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'log_in_bloc.dart';

@immutable
sealed class LogInEvent {}

class Login extends LogInEvent {
  final LoginModel user;
  Login({
    required this.user,
  });
}
