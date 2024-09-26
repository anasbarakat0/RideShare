// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:rideshare_/core/error/exception.dart';
import 'package:rideshare_/features/reservations/data/model/update_to_during_reservation_model.dart';
import 'package:rideshare_/features/reservations/data/sources/remote/update_to_during_reservation_service.dart';

class UpdateToDuringReservationRepo {
  final UpdateToDuringReservationService updateToDuringReservationService;
  UpdateToDuringReservationRepo({
    required this.updateToDuringReservationService,
  });

  Future<UpdateToDuringReservationModel> updateToDuringReservationRepo(
      int id) async {
    try {
      var data = await updateToDuringReservationService
          .updateToDuringReservationService(id);

      return UpdatedToDuringReservation.fromMap(data.data);
    } on ConflictUpdate catch (e) {
      return ExceptionRequest(conflictUpdate: e);
    } on BadRequest catch (e) {
      return ExceptionRequest(badRequest: e);
    } on DioException catch (e) {
      return ExceptionRequest(
          badRequest: BadRequest(
              message: e.response!.data,
              status: "status",
              localDateTime: "localDateTime"));
    }
  }
}
