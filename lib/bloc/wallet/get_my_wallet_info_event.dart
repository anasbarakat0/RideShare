// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_my_wallet_info_bloc.dart';

@immutable
sealed class GetMyWalletInfoEvent {}

class GetInfo extends GetMyWalletInfoEvent {}
