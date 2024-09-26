// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class Success extends SignUpState {}

class Loading extends SignUpState {}

class Error extends SignUpState {
  final String message;
  Error({
    required this.message,
  });
}

class Exception extends SignUpState {
  final List<String> message;
  Exception({
    required this.message,
  });
}
