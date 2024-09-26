import 'package:dio/dio.dart';
import 'package:rideshare_/core/error/exception.dart';
import 'package:rideshare_/temp/service/service.dart';

class GetAllBicycleService extends Service {
  GetAllBicycleService(super.dio);
  Future<Response> getAllBicycleservice() async {
    try {
      response = await dio.get("$baseUrl/api/v1/bicycle", options: options);
      if (response.data["body"].isEmpty) {
        throw EmptyBicycleRespons;
      } else {
        return response;
      }
    } on DioException {
      rethrow;
    }
  }

  Future<Response> getAllBicycleByHubservice(
      int id, String bicycleCategory) async {
    try {
      response = await dio.get(
          "$baseUrl/api/v1/hub-content/$id?bicycleCategory=$bicycleCategory",
          options: options);

      return response;
    } on DioException {
      rethrow;
    }
  }
}
