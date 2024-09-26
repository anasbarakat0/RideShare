// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_all_valid_codes_bloc.dart';

@immutable
sealed class GetAllValidCodesEvent {}

class GetCodes extends GetAllValidCodesEvent {}
