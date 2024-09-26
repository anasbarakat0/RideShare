import 'package:dio/dio.dart';
import 'package:rideshare_/model/Settings/change_password_respond.dart';
import 'package:rideshare_/service/service.dart';

class DeletReservationService extends Service {
  DeletReservationService(super.dio);

  Future<Response> deletReservationService(int id) async {
    try {
      response = await dio.delete(
        "$baseUrl/api/v1/reservation/$id",
        options: options,
      );

      return response;
    } on DioException catch (e) {
      if (e.response!.data["status"] == "BAD_REQUEST") {
        throw BadRequest.fromMap(e.response!.data);
      } else {
        rethrow;
      }
    }
  }
}
