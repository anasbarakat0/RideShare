import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rideshare_/features/favourite/data/model/favourite_model.dart';
import 'package:rideshare_/features/favourite/data/repository/delete_favourite_repo.dart';

part 'delete_favourite_event.dart';
part 'delete_favourite_state.dart';

class DeleteFavouriteBloc
    extends Bloc<DeleteFavouriteEvent, DeleteFavouriteState> {
  final DeleteFavouriteRepo deleteFavouriteRepo;
  DeleteFavouriteBloc(this.deleteFavouriteRepo)
      : super(DeleteFavouriteInitial()) {
    on<DeleteItem>((event, emit) async {
      var data = await deleteFavouriteRepo.deleteFavouriteRepo(event.id);
      if (data is DeletedRespond) {
        emit(DeleteFavourite(deletedRespond: data));
      } else if (data is BadFavoriteRespond) {
        emit(BadDeleteResponse(badFavoriteRespond: data));
      } else if (data is ExceptionFavoriteRespond) {
        emit(ExceptionDeleteRespond(exceptionFavoriteRespond: data));
      } else {
        emit(LoadingDeleteFavourite());
      }
    });
  }
}
