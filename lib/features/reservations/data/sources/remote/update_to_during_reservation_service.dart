import 'package:dio/dio.dart';
import 'package:rideshare_/core/error/exception.dart';
import 'package:rideshare_/temp/service/service.dart';

class UpdateToDuringReservationService extends Service {
  UpdateToDuringReservationService(super.dio);

  Future<Response> updateToDuringReservationService(int id) async {
    try {
      response = await dio.put(
          "$baseUrl/api/v1/reservation/update-to-during-Reservation/:id?id=$id",
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
