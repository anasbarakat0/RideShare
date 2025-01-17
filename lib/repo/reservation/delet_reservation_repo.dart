// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:rideshare_/model/Settings/change_password_respond.dart';
import 'package:rideshare_/model/reservation/delet_reservation_model.dart';
import 'package:rideshare_/service/reservation/delet_reservation_service.dart';

class DeletReservationRepo {
  final DeletReservationService deletReservationService;
  DeletReservationRepo({
    required this.deletReservationService,
  });

  Future<DeletReservationModel> deletReservationRepo(int id) async {
    try {
      var data = await deletReservationService.deletReservationService(id);
      return DeletedModel.fromMap(data.data);
    } on BadRequest catch (b) {
      return BadDeletModel.fromMap(b.toMap());
    } on DioException catch (d) {
      return ExceptionDeletModel(message: d.response!.data);
    }
  }
}
