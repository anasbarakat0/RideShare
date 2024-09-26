// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_favourite_bloc.dart';

@immutable
sealed class AddFavouriteState {}

final class AddFavouriteInitial extends AddFavouriteState {}

class AddedToFavourite extends AddFavouriteState {
  final FavouriteRespond favouriteRespond;
  AddedToFavourite({
    required this.favouriteRespond,
  });
}

class BadResponse extends AddFavouriteState {
  final BadFavoriteRespond badFavoriteRespond;
  BadResponse({
    required this.badFavoriteRespond,
  });
}

class ExceptionRespond extends AddFavouriteState {
  final ExceptionFavoriteRespond exceptionFavoriteRespond;
  ExceptionRespond({
    required this.exceptionFavoriteRespond,
  });
}

class LoadingFavourite extends AddFavouriteState {}
