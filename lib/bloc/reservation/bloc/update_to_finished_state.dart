part of 'update_to_finished_bloc.dart';

@immutable
sealed class UpdateToFinishedState {}

final class UpdateToFinishedInitial extends UpdateToFinishedState {}

class SuccessUpdating extends UpdateToFinishedState {
  final UpdatedToFinished updatedToFinished;
  SuccessUpdating({
    required this.updatedToFinished,
  });
}

class ExceptionUpdation extends UpdateToFinishedState {
  final ExceptionRequest exceptionRequest;
  ExceptionUpdation({
    required this.exceptionRequest,
  });
}

class LoadingUpdating extends UpdateToFinishedState {}
