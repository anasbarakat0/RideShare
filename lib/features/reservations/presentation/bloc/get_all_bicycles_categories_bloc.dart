import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rideshare_/features/reservations/data/model/get_all_bicycles_categories_model.dart';
import 'package:rideshare_/features/reservations/data/repository/get_all_bicycles_categories_repo.dart';

part 'get_all_bicycles_categories_event.dart';
part 'get_all_bicycles_categories_state.dart';

class GetAllBicyclesCategoriesBloc
    extends Bloc<GetAllBicyclesCategoriesEvent, GetAllBicyclesCategoriesState> {
  final GetAllBicyclesCategoriesRepo getAllBicyclesCategoriesRepo;
  GetAllBicyclesCategoriesBloc(this.getAllBicyclesCategoriesRepo)
      : super(GetAllBicyclesCategoriesInitial()) {
    on<GetBicyclesCategories>((event, emit) async {
      var data =
          await getAllBicyclesCategoriesRepo.getAllBicyclesCategoriesRepo();
      if (data is SuccessGettingCategories) {
        emit(SuccessGettingAllBicyclesCategories(
            successGettingCategories: data));
      } else if (data is ExceptionGettingCategories) {
        emit(ExceptionCategories(message: data.message));
      } else {
        emit(LoadingGettingCategories());
      }
    });
  }
}
