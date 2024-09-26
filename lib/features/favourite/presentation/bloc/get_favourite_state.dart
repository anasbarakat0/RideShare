part of 'get_favourite_bloc.dart';

@immutable
sealed class GetFavouriteState {}

final class GetFavouriteInitial extends GetFavouriteState {}

class AddedToFavourite extends GetFavouriteState {
  final AllFavouriteRespond allFavouriteRespond;
  AddedToFavourite({
    required this.allFavouriteRespond,
  });
}

class BadResponse extends GetFavouriteState {
  final BadFavoriteRespond badFavoriteRespond;
  BadResponse({
    required this.badFavoriteRespond,
  });
}

class ExceptionRespond extends GetFavouriteState {
  final ExceptionFavoriteRespond exceptionFavoriteRespond;
  ExceptionRespond({
    required this.exceptionFavoriteRespond,
  });
}

class LoadingFavourite extends GetFavouriteState {}
