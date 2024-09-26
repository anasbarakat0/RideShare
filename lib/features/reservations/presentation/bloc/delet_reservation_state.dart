// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'delet_reservation_bloc.dart';

@immutable
sealed class DeletReservationState {}

final class DeletReservationInitial extends DeletReservationState {}

class SuccessDeletReservation extends DeletReservationState {
  final DeletedModel deletedModel;
  SuccessDeletReservation({
    required this.deletedModel,
  });
}

class BadDeletedResponse extends DeletReservationState {
  final BadDeletModel badDeletModel;
  BadDeletedResponse({
    required this.badDeletModel,
  });
}

class ExceptionDeletingResponse extends DeletReservationState {
  final ExceptionDeletModel exceptionDeletModel;
  ExceptionDeletingResponse({
    required this.exceptionDeletModel,
  });
}

class LoadingDelete extends DeletReservationState {}
