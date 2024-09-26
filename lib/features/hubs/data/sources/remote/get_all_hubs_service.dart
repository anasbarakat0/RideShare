import 'package:dio/dio.dart';
import 'package:rideshare_/core/error/exception.dart';
import 'package:rideshare_/temp/service/service.dart';

class GetAllHubsService extends Service {
  GetAllHubsService(super.dio);

  Future<Response> getAllHubsService(double lan, double lat) async {
    try {
      response = await dio.get(
        "$baseUrl/api/v1/hubs?longtitude=$lan&latitude=$lat",
        options: options,
      );
      if (response.data["body"].isEmpty) {
        throw EmptyHubs;
      } else {
        return response;
      }
    } on DioException {
      rethrow;
    }
  }
}
