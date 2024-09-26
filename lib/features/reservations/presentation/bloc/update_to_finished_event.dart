// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'update_to_finished_bloc.dart';

@immutable
sealed class UpdateToFinishedEvent {}

class UpdateFinished extends UpdateToFinishedEvent {
  final int id;
  UpdateFinished({
    required this.id,
  });
}
