import 'package:dio/dio.dart';
import 'package:rideshare_/model/Settings/change_password_respond.dart';
import 'package:rideshare_/service/service.dart';

class GetOffersService extends Service {
  GetOffersService(super.dio);

  Future<Response> getOffersService() async {
    try {
      response = await dio.get(
        "$baseUrl/api/v1/bicycle/discountBicycles",
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
