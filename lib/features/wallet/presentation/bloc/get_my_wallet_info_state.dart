// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_my_wallet_info_bloc.dart';

@immutable
sealed class GetMyWalletInfoState {}

final class GetMyWalletInfoInitial extends GetMyWalletInfoState {}

class SuccessGettingMyWalletInfo extends GetMyWalletInfoState {
  final GettingMyWalletInfo walletInfoModel;
  SuccessGettingMyWalletInfo({
    required this.walletInfoModel,
  });
}

class NoWalletToShowState extends GetMyWalletInfoState {
  final String message;
  NoWalletToShowState({
    required this.message,
  });
}

class ExceptionGettingMyWalletInfo extends GetMyWalletInfoState {
  final String message;
  ExceptionGettingMyWalletInfo({
    required this.message,
  });
}

class LoadingGettingMyWalletInfo extends GetMyWalletInfoState {}
