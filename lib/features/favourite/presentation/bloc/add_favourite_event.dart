// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_favourite_bloc.dart';

@immutable
sealed class AddFavouriteEvent {}

class AddFavourite extends AddFavouriteEvent {
  final int id;
  AddFavourite({
    required this.id,
  });
}
