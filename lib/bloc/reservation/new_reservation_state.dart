part of 'new_reservation_bloc.dart';

@immutable
sealed class NewReservationState {}

final class NewReservationInitial extends NewReservationState {}

final class BadRequiestReservation extends NewReservationState {
  final ReservationBadRequest reservationBadRequest;

  BadRequiestReservation(this.reservationBadRequest);
}

final class ReservationDone extends NewReservationState {
  final ReservationSuccessRespond reservationSuccessRespond;

  ReservationDone(this.reservationSuccessRespond);
}

final class LoadingReservation extends NewReservationState {}
