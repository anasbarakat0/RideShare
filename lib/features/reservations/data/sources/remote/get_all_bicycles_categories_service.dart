import 'package:dio/dio.dart';
import 'package:rideshare_/temp/service/service.dart';

class GetAllBicyclesCategoriesService extends Service {
  GetAllBicyclesCategoriesService(super.dio);

  Future<Response> getAllBicyclesCategoriesService() async {
    try {
      response = await dio.get(
        "$baseUrl/api/v1/bicycle/bicycles-categories",
        options: options,
      );
      return response;
    } on DioException {
      rethrow;
    }
  }
}
