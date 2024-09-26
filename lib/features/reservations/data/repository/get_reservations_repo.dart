// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:rideshare_/core/error/exception.dart';
import 'package:rideshare_/features/reservations/data/model/get_reservations_model.dart';
import 'package:rideshare_/features/reservations/data/sources/remote/get_reservations_service.dart';

class GetReservationsRepo {
  final GetReservationsService getReservationsService;
  GetReservationsRepo({
    required this.getReservationsService,
  });

  Future<GetReservationsModel> getReservationsRepo() async {
    try {
      var data = await getReservationsService.getReservationsService();
      return SuccessGettingReservations.fromMap(data.data);
    } on EmptyReservations catch (e) {
      return ExceptionGettingReservations(message: e.message);
    } on DioException catch (e) {
      return ExceptionGettingReservations(message: e.response!.data);
    }
  }
}
