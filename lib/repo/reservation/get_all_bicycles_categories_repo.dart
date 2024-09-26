// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:rideshare_/model/reservation/get_all_bicycles_categories_model.dart';
import 'package:rideshare_/service/reservation/get_all_bicycles_categories_service.dart';

class GetAllBicyclesCategoriesRepo {
  final GetAllBicyclesCategoriesService getAllBicyclesCategoriesService;
  GetAllBicyclesCategoriesRepo({
    required this.getAllBicyclesCategoriesService,
  });

  Future<GetAllBicyclesCategoriesModel> getAllBicyclesCategoriesRepo() async {
    try {
      var data = await getAllBicyclesCategoriesService
          .getAllBicyclesCategoriesService();

      return SuccessGettingCategories.fromMap(data.data);
    } on DioException catch (e) {
      return ExceptionGettingCategories(message: e.response!.data["message"]);
    }
  }
}
