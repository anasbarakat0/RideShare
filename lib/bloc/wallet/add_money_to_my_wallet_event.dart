// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_money_to_my_wallet_bloc.dart';

@immutable
sealed class AddMoneyToMyWalletEvent {}

class AddMoney extends AddMoneyToMyWalletEvent {
  final String code;
  AddMoney({
    required this.code,
  });
}
