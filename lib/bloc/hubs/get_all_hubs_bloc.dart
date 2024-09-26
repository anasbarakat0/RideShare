import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rideshare_/model/hubs/get_all_hubs_response_model.dart';
import 'package:rideshare_/repo/hubs/get_all_hubs_repo.dart';

part 'get_all_hubs_event.dart';
part 'get_all_hubs_state.dart';

class GetAllHubsBloc extends Bloc<GetAllHubsEvent, GetAllHubsState> {
  final GetAllHubsRepo getAllHubsRepo;
  GetAllHubsBloc(this.getAllHubsRepo) : super(GetAllHubsInitial()) {
    on<GetAllHubs>((event, emit) async {
      var data = await getAllHubsRepo.getAllHubsRepo(event.lon, event.lat);
      if (data is EmptyResponse) {
        emit(EmptyHubs(data.message));
      } else if (data is ExceptionResponse) {
        emit(ExceptionGettingAllHubs(data.message));
      } else if (data is SuccessResponse) {
        emit(SuccessGettingAllHubs(data));
      } else {
        emit(LoadingGetAllHubs());
      }
    });
  }
}
