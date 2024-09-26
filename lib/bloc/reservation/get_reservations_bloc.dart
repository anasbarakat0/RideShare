import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rideshare_/model/reservation/get_reservations_model.dart';
import 'package:rideshare_/repo/reservation/get_reservations_repo.dart';

part 'get_reservations_event.dart';
part 'get_reservations_state.dart';

class GetReservationsBloc
    extends Bloc<GetReservationsEvent, GetReservationsState> {
  final GetReservationsRepo getReservationsRepo;
  GetReservationsBloc(this.getReservationsRepo)
      : super(GetReservationsInitial()) {
    on<GetReservation>((event, emit) async {
      var data = await getReservationsRepo.getReservationsRepo();
      if (data is SuccessGettingReservations) {
        emit(
          SuccessFetchingReservations(
            successGettingReservations: data,
          ),
        );
      } else if (data is ExceptionGettingReservations) {
        emit(
          ExceptionFetchingReservations(
            exceptionGettingReservations: data,
          ),
        );
      } else {
        emit(LoadingGettingReservations());
      }
    });
  }
}
