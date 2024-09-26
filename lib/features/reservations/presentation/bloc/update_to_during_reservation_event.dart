// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'update_to_during_reservation_bloc.dart';

@immutable
sealed class UpdateToDuringReservationEvent {}

class UpdateDuring extends UpdateToDuringReservationEvent {
  final int id;
  UpdateDuring({
    required this.id,
  });
}
