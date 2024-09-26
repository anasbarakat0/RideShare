// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_reservations_bloc.dart';

@immutable
sealed class GetReservationsState {}

final class GetReservationsInitial extends GetReservationsState {}

class SuccessFetchingReservations extends GetReservationsState {
  final SuccessGettingReservations successGettingReservations;
  SuccessFetchingReservations({
    required this.successGettingReservations,
  });
}

class ExceptionFetchingReservations extends GetReservationsState {
  final ExceptionGettingReservations exceptionGettingReservations;
  ExceptionFetchingReservations({
    required this.exceptionGettingReservations,
  });
}

class EmptyReservationsFetching extends GetReservationsState {
  final String message;
  EmptyReservationsFetching({
    required this.message,
  });
}

class LoadingGettingReservations extends GetReservationsState {}
