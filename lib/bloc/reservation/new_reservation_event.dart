part of 'new_reservation_bloc.dart';

@immutable
sealed class NewReservationEvent {}

class NewReservationReq extends NewReservationEvent {
  final NewReservationModel reservation;

  NewReservationReq(this.reservation);
}
