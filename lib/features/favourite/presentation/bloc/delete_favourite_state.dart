part of 'delete_favourite_bloc.dart';

@immutable
sealed class DeleteFavouriteState {}

final class DeleteFavouriteInitial extends DeleteFavouriteState {}

class DeleteFavourite extends DeleteFavouriteState {
  final DeletedRespond deletedRespond;
  DeleteFavourite({
    required this.deletedRespond,
  });
}

class BadDeleteResponse extends DeleteFavouriteState {
  final BadFavoriteRespond badFavoriteRespond;
  BadDeleteResponse({
    required this.badFavoriteRespond,
  });
}

class ExceptionDeleteRespond extends DeleteFavouriteState {
  final ExceptionFavoriteRespond exceptionFavoriteRespond;
  ExceptionDeleteRespond({
    required this.exceptionFavoriteRespond,
  });
}

class LoadingDeleteFavourite extends DeleteFavouriteState {}
