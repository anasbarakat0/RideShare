import 'package:dio/dio.dart';
import 'package:rideshare_/features/settings/change_password/data/model/change_password_respond.dart';
import 'package:rideshare_/temp/service/service.dart';

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
