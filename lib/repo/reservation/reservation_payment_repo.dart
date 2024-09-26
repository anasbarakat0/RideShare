// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:rideshare_/model/error/exception.dart' as exception;
import 'package:rideshare_/model/reservation/reservation_payment_model.dart';
import 'package:rideshare_/service/reservation/resrvation_payment_service.dart';

class ReservationPaymentRepo {
  final ResrvationPaymentService resrvationPaymentService;
  ReservationPaymentRepo({
    required this.resrvationPaymentService,
  });

  Future<ReservationPaymentResponse> reservationPaymentRepo(
      ReservationPaymentModel reservationPayment) async {
    try {
      var data = await resrvationPaymentService
          .resrvationPaymentService(reservationPayment);

      return ReservationPaymentSuccess.fromJson(data.data);
    } on exception.BadRequestPayment catch (e) {
      return e.badRequest;
    } on DioException catch (e) {
      return BadRequest(
          localDateTime: '', status: '', message: e.response!.data);
    }
  }
}
