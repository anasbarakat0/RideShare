import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rideshare_/model/favourite/favourite_model.dart';
import 'package:rideshare_/repo/favourite/add_favourite_repo.dart';

part 'add_favourite_event.dart';
part 'add_favourite_state.dart';

class AddFavouriteBloc extends Bloc<AddFavouriteEvent, AddFavouriteState> {
  final AddFavouriteRepo addFavouriteRepo;
  AddFavouriteBloc(this.addFavouriteRepo) : super(AddFavouriteInitial()) {
    on<AddFavourite>((event, emit) async {
      var data = await addFavouriteRepo.addFavouriteRepo(event.id);
      if (data is FavouriteRespond) {
        emit(AddedToFavourite(favouriteRespond: data));
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
