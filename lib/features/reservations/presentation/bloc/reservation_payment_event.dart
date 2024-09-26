// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'reservation_payment_bloc.dart';

@immutable
sealed class ReservationPaymentEvent {}

class PayReservation extends ReservationPaymentEvent {
  final ReservationPaymentModel reservationPayment;
  PayReservation({
    required this.reservationPayment,
  });
}
