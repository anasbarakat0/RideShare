// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'privacy_policy_bloc.dart';

@immutable
sealed class PrivacyPolicyState {}

final class PrivacyPolicyInitial extends PrivacyPolicyState {}

class SuccessGettingPolicy extends PrivacyPolicyState {
  final PrivacyPolicyModel privacyPolicyModel;
  SuccessGettingPolicy({
    required this.privacyPolicyModel,
  });
}

class ExceptionGettingPolicy extends PrivacyPolicyState {
  final String message;
  ExceptionGettingPolicy({
    required this.message,
  });
}

class LoadingGettingPolicy extends PrivacyPolicyState {}
