part of 'create_new_wallet_bloc.dart';

@immutable
sealed class CreateNewWalletEvent {}

class CreateNewWallet extends CreateNewWalletEvent {
  final CreateNewWalletModel createNewWalletModel;
  CreateNewWallet({required this.createNewWalletModel});
}
