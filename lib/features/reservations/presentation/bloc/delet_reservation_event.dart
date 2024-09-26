// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'delet_reservation_bloc.dart';

@immutable
sealed class DeletReservationEvent {}

class DeletReservation extends DeletReservationEvent {
  final int id;
  DeletReservation({
    required this.id,
  });
}
