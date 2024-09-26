// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'update_to_during_reservation_bloc.dart';

@immutable
sealed class UpdateToDuringReservationState {}

final class UpdateToDuringReservationInitial
    extends UpdateToDuringReservationState {}

class SuccessUpdating extends UpdateToDuringReservationState {
  final UpdatedToDuringReservation updatedToDuringReservation;
  SuccessUpdating({
    required this.updatedToDuringReservation,
  });
}

class ExceptionUpdation extends UpdateToDuringReservationState {
  final ExceptionRequest exceptionRequest;
  ExceptionUpdation({
    required this.exceptionRequest,
  });
}

class LoadingUpdating extends UpdateToDuringReservationState {}
