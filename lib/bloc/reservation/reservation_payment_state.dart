// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'reservation_payment_bloc.dart';

@immutable
sealed class ReservationPaymentState {}

final class ReservationPaymentInitial extends ReservationPaymentState {}

class SuccessReservationPayment extends ReservationPaymentState {
  final ReservationPaymentSuccess reservationPaymentSuccess;
  SuccessReservationPayment({
    required this.reservationPaymentSuccess,
  });
}

class FaildReservationPayment extends ReservationPaymentState {
  final BadRequest badRequest;
  FaildReservationPayment({
    required this.badRequest,
  });
}

class LoadingPay extends ReservationPaymentState {}
