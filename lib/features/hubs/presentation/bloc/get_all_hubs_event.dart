// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_all_hubs_bloc.dart';

@immutable
sealed class GetAllHubsEvent {}

class GetAllHubs extends GetAllHubsEvent {
  final double lon;
  final double lat;
  GetAllHubs({
    required this.lon,
    required this.lat,
  });
}
