import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rideshare_/features/reservations/data/model/update_to_during_reservation_model.dart';
import 'package:rideshare_/features/reservations/data/repository/update_to_during_reservation_repo.dart';

part 'update_to_during_reservation_event.dart';
part 'update_to_during_reservation_state.dart';

class UpdateToDuringReservationBloc extends Bloc<UpdateToDuringReservationEvent,
    UpdateToDuringReservationState> {
  final UpdateToDuringReservationRepo updateToDuringReservationRepo;
  UpdateToDuringReservationBloc(this.updateToDuringReservationRepo)
      : super(UpdateToDuringReservationInitial()) {
    on<UpdateDuring>((event, emit) async {
      var data = await updateToDuringReservationRepo
          .updateToDuringReservationRepo(event.id);
      if (data is UpdatedToDuringReservation) {
        emit(SuccessUpdating(updatedToDuringReservation: data));
      } else if (data is ExceptionRequest) {
        emit(ExceptionUpdation(exceptionRequest: data));
      } else {
        emit(LoadingUpdating());
      }
    });
  }
}
