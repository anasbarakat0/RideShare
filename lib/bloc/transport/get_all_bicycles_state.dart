// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_all_bicycles_bloc.dart';

@immutable
sealed class GetAllBicyclesState {}

final class GetAllBicyclesInitial extends GetAllBicyclesState {}

class SuccessFetchAllBicycles extends GetAllBicyclesState {
  final BicycleRespondModel? bicycles;
  final byHub.BicycleByHubRespondModel? bicyclesHub;
  SuccessFetchAllBicycles({
    this.bicycles,
    this.bicyclesHub,
  });
}

class FetchingEmptyBicycles extends GetAllBicyclesState {
  final String message;
  FetchingEmptyBicycles({
    required this.message,
  });
}

class ExceptionGettingBicycles extends GetAllBicyclesState {
  final String message;
  ExceptionGettingBicycles({
    required this.message,
  });
}

class LoadingWhileGettingAllBicycles extends GetAllBicyclesState {}
