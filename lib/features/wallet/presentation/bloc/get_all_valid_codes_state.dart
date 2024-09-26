// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_all_valid_codes_bloc.dart';

@immutable
sealed class GetAllValidCodesState {}

final class GetAllValidCodesInitial extends GetAllValidCodesState {}

class GettingValidCodes extends GetAllValidCodesState {
  final GetValidCodes getValidCodes;
  GettingValidCodes({
    required this.getValidCodes,
  });
}

class GettingNoCode extends GetAllValidCodesState {
  final GetNoCodes getNoCodes;
  GettingNoCode({
    required this.getNoCodes,
  });
}

class ExceptionWhileGettingCodes extends GetAllValidCodesState {
  final ExceptionGettingCodes exceptionGettingCodes;
  ExceptionWhileGettingCodes({
    required this.exceptionGettingCodes,
  });
}

class LoadingGettingCodes extends GetAllValidCodesState {}
