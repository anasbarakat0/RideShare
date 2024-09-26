// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_all_bicycles_categories_bloc.dart';

@immutable
sealed class GetAllBicyclesCategoriesState {}

final class GetAllBicyclesCategoriesInitial
    extends GetAllBicyclesCategoriesState {}

class SuccessGettingAllBicyclesCategories
    extends GetAllBicyclesCategoriesState {
  final SuccessGettingCategories successGettingCategories;
  SuccessGettingAllBicyclesCategories({
    required this.successGettingCategories,
  });
}

class ExceptionCategories extends GetAllBicyclesCategoriesState {
  final String message;
  ExceptionCategories({
    required this.message,
  });
}

class LoadingGettingCategories extends GetAllBicyclesCategoriesState {}
