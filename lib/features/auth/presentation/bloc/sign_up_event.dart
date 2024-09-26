// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

// ignore: must_be_immutable
class SignUpUser extends SignUpEvent {
  SignUpModel user;
  SignUpUser({
    required this.user,
  });
}
