// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_money_to_my_wallet_bloc.dart';

@immutable
sealed class AddMoneyToMyWalletState {}

final class AddMoneyToMyWalletInitial extends AddMoneyToMyWalletState {}

class SuccessAddingMoney extends AddMoneyToMyWalletState {
  final ValidCodesModel validCodesModel;
  SuccessAddingMoney({
    required this.validCodesModel,
  });
}

class UnvalidForAddingMoney extends AddMoneyToMyWalletState {
  final UnValidCodeModel unValidCodeModel;
  UnvalidForAddingMoney({
    required this.unValidCodeModel,
  });
}

class ExceptioAddingMoney extends AddMoneyToMyWalletState {
  final ExceptionCode exceptionCode;
  ExceptioAddingMoney({
    required this.exceptionCode,
  });
}

class LoadingAddingMoney extends AddMoneyToMyWalletState {}
