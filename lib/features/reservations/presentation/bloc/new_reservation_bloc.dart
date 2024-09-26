import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rideshare_/features/reservations/data/model/new_reservation_model.dart';
import 'package:rideshare_/features/reservations/data/repository/new_reservation_repo.dart';

part 'new_reservation_event.dart';
part 'new_reservation_state.dart';

class NewReservationBloc
    extends Bloc<NewReservationEvent, NewReservationState> {
  final NewReservationRepo newReservationRepo;
  NewReservationBloc(this.newReservationRepo) : super(NewReservationInitial()) {
    on<NewReservationReq>((event, emit) async {
      var data = await newReservationRepo.newReservationRepo(event.reservation);

      if (data is ReservationSuccessRespond) {
        emit(ReservationDone(data));
      } else if (data is ReservationBadRequest) {
        emit(BadRequiestReservation(data));
      } else {
        emit(LoadingReservation());
      }
    });
  }
}
