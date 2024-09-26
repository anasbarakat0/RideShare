import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rideshare_/features/reservations/data/model/update_to_finished_model.dart';
import 'package:rideshare_/features/reservations/data/repository/update_to_finished_repo.dart';

part 'update_to_finished_event.dart';
part 'update_to_finished_state.dart';

class UpdateToFinishedBloc
    extends Bloc<UpdateToFinishedEvent, UpdateToFinishedState> {
  final UpdateToFinishedRepo updateToFinishedRepo;
  UpdateToFinishedBloc(this.updateToFinishedRepo)
      : super(UpdateToFinishedInitial()) {
    on<UpdateFinished>((event, emit) async {
      var data = await updateToFinishedRepo.updateToFinishedRepo(event.id);
      if (data is UpdatedToFinished) {
        emit(SuccessUpdating(updatedToFinished: data));
      } else if (data is ExceptionRequest) {
        emit(ExceptionUpdation(exceptionRequest: data));
      } else {
        emit(LoadingUpdating());
      }
    });
  }
}
