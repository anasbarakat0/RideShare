part of 'get_all_hubs_bloc.dart';

@immutable
sealed class GetAllHubsState {}

final class GetAllHubsInitial extends GetAllHubsState {}

final class SuccessGettingAllHubs extends GetAllHubsState {
  final SuccessResponse hubs;

  SuccessGettingAllHubs(this.hubs);
}

final class EmptyHubs extends GetAllHubsState {
  final String message;

  EmptyHubs(this.message);
}

final class ExceptionGettingAllHubs extends GetAllHubsState {
  final String message;

  ExceptionGettingAllHubs(this.message);
}

final class LoadingGetAllHubs extends GetAllHubsState {}
