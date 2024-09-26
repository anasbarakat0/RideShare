import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rideshare_/model/reservation/delet_reservation_model.dart';
import 'package:rideshare_/repo/reservation/delet_reservation_repo.dart';

part 'delet_reservation_event.dart';
part 'delet_reservation_state.dart';

class DeletReservationBloc
    extends Bloc<DeletReservationEvent, DeletReservationState> {
  final DeletReservationRepo deletReservationRepo;
  DeletReservationBloc(this.deletReservationRepo)
      : super(DeletReservationInitial()) {
    on<DeletReservation>(
      (event, emit) async {
        var data = await deletReservationRepo.deletReservationRepo(event.id);
        if (data is DeletedModel) {
          emit(SuccessDeletReservation(deletedModel: data));
        } else if (data is BadDeletModel) {
          emit(BadDeletedResponse(badDeletModel: data));
        } else if (data is ExceptionDeletModel) {
          emit(ExceptionDeletingResponse(exceptionDeletModel: data));
        } else {
          emit(LoadingDelete());
        }
      },
    );
  }
}
