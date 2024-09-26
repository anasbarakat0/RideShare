import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rideshare_/features/bicycles/data/model/bicycle_by_hub_model.dart'
    as byHub;

import 'package:rideshare_/features/bicycles/data/model/bicycle_respond_model.dart';
import 'package:rideshare_/features/bicycles/data/repository/get_all_bicycle_repo.dart';

part 'get_all_bicycles_event.dart';
part 'get_all_bicycles_state.dart';

class GetAllBicyclesBloc
    extends Bloc<GetAllBicyclesEvent, GetAllBicyclesState> {
  final GetAllBicyclesRepo getAllBicyclesRepo;
  GetAllBicyclesBloc(this.getAllBicyclesRepo) : super(GetAllBicyclesInitial()) {
    on<GetAllBicycles>((event, emit) async {
      var data = await getAllBicyclesRepo.getAllBicyclesRepo();
      if (data is EmptyBicycleRespondModel) {
        emit(FetchingEmptyBicycles(message: data.message));
      } else if (data is ExceptionBicycleRespondModel) {
        emit(ExceptionGettingBicycles(message: data.message));
      } else if (data is BicycleRespondModel) {
        emit(SuccessFetchAllBicycles(bicycles: data));
      } else {
        emit(LoadingWhileGettingAllBicycles());
      }
    });

    on<GetAllBicyclesByHub>((event, emit) async {
      var data = await getAllBicyclesRepo.getAllBicyclesByHubRepo(
          event.id, event.bicycleCategory);
      if (data is byHub.ExceptionBicycleRespondModel) {
        emit(ExceptionGettingBicycles(message: data.message));
      } else if (data is byHub.BicycleByHubRespondModel) {
        emit(SuccessFetchAllBicycles(bicyclesHub: data));
      } else {
        emit(LoadingWhileGettingAllBicycles());
      }
    });
  }
}
