import 'package:dio/dio.dart';
import 'package:rideshare_/features/reservations/data/model/new_reservation_model.dart';
import 'package:rideshare_/core/error/exception.dart';
import 'package:rideshare_/temp/service/service.dart';

class NewReservationService extends Service {
  NewReservationService(super.dio);

  Future<Response> newReservationService(
      NewReservationModel reservation) async {
    try {
      response = await dio.post("$baseUrl/api/v1/reservation",
          options: options, data: reservation.toMap());
      if (response.data["message"] == "Reserved, Try another Time") {
        throw BicycleReserved(
            reservationBadRequest:
                ReservationBadRequest.fromMap(response.data));
      } else {
        return response;
      }
    } on DioException catch (e) {
      if (e.response!.data["message"] == "Bicycle not found") {
        throw BicycleNotFound(
            reservationBadRequest:
                ReservationBadRequest.fromMap(e.response!.data));
      } else if (e.response!.data["message"] == "Source hub not found") {
        throw SourceHubNotFound(
            reservationBadRequest:
                ReservationBadRequest.fromMap(e.response!.data));
      } else if (e.response!.data["message"] == "Target hub not found") {
        throw TargetHubNotFound(
            reservationBadRequest:
                ReservationBadRequest.fromMap(e.response!.data));
      } else if (e.response!.data["message"] == "Bicycle not found in source") {
        throw BicycleNotFoundInSource(
            reservationBadRequest:
                ReservationBadRequest.fromMap(e.response!.data));
      } else if (e.response!.data["message"] == "Reserved, Try another Time") {
        throw BicycleReserved(
            reservationBadRequest:
                ReservationBadRequest.fromMap(e.response!.data));
      } else {
        rethrow;
      }
    }
  }
}
