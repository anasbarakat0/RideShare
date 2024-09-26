import 'package:dio/dio.dart';
import 'package:rideshare_/model/error/exception.dart';
import 'package:rideshare_/service/service.dart';

class UpdateToFinishedService extends Service {
  UpdateToFinishedService(super.dio);

  Future<Response> updateToFinishedService(int id) async {
    try {
      response = await dio.put(
          "$baseUrl/api/v1/reservation/update-to-finished/$id",
          options: options);
      return response;
    } on DioException catch (e) {
      if (e.response!.data["status"] == "CONFLICT") {
        throw ConflictUpdate.fromMap(e.response!.data);
      } else if (e.response!.data["status"] == "BAD_REQUEST") {
        throw BadRequest.fromMap(e.response!.data);
      } else {
        rethrow;
      }
    }
  }
}
