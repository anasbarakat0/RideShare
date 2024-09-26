import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rideshare_/features/reservations/data/model/reservation_payment_model.dart';
import 'package:rideshare_/features/reservations/data/repository/reservation_payment_repo.dart';

part 'reservation_payment_event.dart';
part 'reservation_payment_state.dart';

class ReservationPaymentBloc
    extends Bloc<ReservationPaymentEvent, ReservationPaymentState> {
  final ReservationPaymentRepo reservationPaymentRepo;
  ReservationPaymentBloc(this.reservationPaymentRepo)
      : super(ReservationPaymentInitial()) {
    on<PayReservation>((event, emit) async {
      var data = await reservationPaymentRepo
          .reservationPaymentRepo(event.reservationPayment);
      if (data is BadRequest) {
        emit(FaildReservationPayment(badRequest: data));
      } else if (data is ReservationPaymentSuccess) {
        emit(SuccessReservationPayment(reservationPaymentSuccess: data));
      } else {
        emit(LoadingPay());
      }
    });
  }
}
