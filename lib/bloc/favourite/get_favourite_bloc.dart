import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rideshare_/model/favourite/favourite_model.dart';
import 'package:rideshare_/repo/favourite/get_favourite_repo.dart';

part 'get_favourite_event.dart';
part 'get_favourite_state.dart';

class GetFavouriteBloc extends Bloc<GetFavouriteEvent, GetFavouriteState> {
  final GetFavouriteRepo getFavouriteRepo;
  GetFavouriteBloc(this.getFavouriteRepo) : super(GetFavouriteInitial()) {
    on<GetAllFavourite>((event, emit) async {
      var data = await getFavouriteRepo.getFavouriteRepo();
      if (data is AllFavouriteRespond) {
        emit(AddedToFavourite(allFavouriteRespond: data));
      } else if (data is BadFavoriteRespond) {
        emit(BadResponse(badFavoriteRespond: data));
      } else if (data is ExceptionFavoriteRespond) {
        emit(ExceptionRespond(exceptionFavoriteRespond: data));
      } else {
        emit(LoadingFavourite());
      }
    });
  }
}
