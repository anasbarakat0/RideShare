import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rideshare_/model/reservation/update_to_during_reservation_model.dart';
import 'package:rideshare_/repo/reservation/update_to_during_reservation_repo.dart';

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
