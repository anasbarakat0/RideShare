import 'package:dio/dio.dart';
import 'package:rideshare_/core/error/exception.dart';
import 'package:rideshare_/temp/service/service.dart';
import 'package:rideshare_/core/resources/shared_prefrences/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetReservationsService extends Service {
  GetReservationsService(super.dio);

  Future<Response> getReservationsService() async {
    try {
      response = await dio.get(
          "$baseUrl/api/v1/reservation/by-client-id/${storage.get<SharedPreferences>().getInt("id")}",
          options: options);
      if (response.data["body"] == null) {
        throw EmptyReservations(message: "Ther are no reservations");
      } else {
        return response;
      }
    } on DioException {
      rethrow;
    }
  }
}
