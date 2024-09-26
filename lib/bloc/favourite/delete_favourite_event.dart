// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'delete_favourite_bloc.dart';

@immutable
sealed class DeleteFavouriteEvent {}

class DeleteItem extends DeleteFavouriteEvent {
  final int id;
  DeleteItem({
    required this.id,
  });
}
