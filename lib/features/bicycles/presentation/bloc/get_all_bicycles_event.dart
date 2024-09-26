// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_all_bicycles_bloc.dart';

@immutable
sealed class GetAllBicyclesEvent {}

class GetAllBicycles extends GetAllBicyclesEvent {}

class GetAllBicyclesByHub extends GetAllBicyclesEvent {
  final int id;
  final String bicycleCategory;
  GetAllBicyclesByHub({
    required this.id,
    required this.bicycleCategory,
  });
}
