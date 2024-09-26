// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'create_new_wallet_bloc.dart';

@immutable
sealed class CreateNewWalletState {}

final class CreateNewWalletInitial extends CreateNewWalletState {}

class SuccessCreateWallet extends CreateNewWalletState {
  final WalletCreated response;
  SuccessCreateWallet({
    required this.response,
  });
}

class BadRequestCreateWallet extends CreateNewWalletState {
  final BadRequestCreateWalletModel response;
  BadRequestCreateWallet({
    required this.response,
  });
}

class ExceptionCreateWallet extends CreateNewWalletState {
  final ExceptionCreateWalletModel message;
  ExceptionCreateWallet({
    required this.message,
  });
}

class LoadingCreateWallet extends CreateNewWalletState {}
