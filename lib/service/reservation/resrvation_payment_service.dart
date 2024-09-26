import 'package:dio/dio.dart';
import 'package:rideshare_/model/error/exception.dart';
import 'package:rideshare_/model/reservation/reservation_payment_model.dart'
    as payment;
import 'package:rideshare_/service/service.dart';

class ResrvationPaymentService extends Service {
  ResrvationPaymentService(super.dio);

  Future<Response> resrvationPaymentService(
      payment.ReservationPaymentModel reservationPayment) async {
    try {
      response = await dio.post(
        "$baseUrl/api/v1/reservation/reseravation-payment",
        options: options,
        data: reservationPayment.toMap(),
      );
      return response;
    } on DioException catch (e) {
      if (e.response!.data['status'] == "BAD_REQUEST") {
        throw BadRequestPayment(
            badRequest: payment.BadRequest.fromMap(e.response!.data));
      } else if (e.response!.data['status'] == "UNAUTHORIZED") {
        throw BadRequestPayment(
            badRequest: payment.BadRequest.fromMap(e.response!.data));
      } else {
        rethrow;
      }
    }
  }
}
