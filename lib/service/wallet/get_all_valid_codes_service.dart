import 'package:dio/dio.dart';
import 'package:rideshare_/model/error/exception.dart';
import 'package:rideshare_/model/wallet/get_codes_model.dart';
import 'package:rideshare_/service/service.dart';

class GetAllValidCodesService extends Service {
  GetAllValidCodesService(super.dio);

  Future<Response> getAllValidCodesService() async {
    try {
      response = await dio.get("$baseUrl/api/v1/wallet/All-valid-codes",
          options: options);
      if (response.data['body'].isEmpty) {
        throw NoValidCode(getNoCodes: GetNoCodes.fromMap(response.data));
      } else {
        return response;
      }
    } on DioException {
      rethrow;
    }
  }
}
