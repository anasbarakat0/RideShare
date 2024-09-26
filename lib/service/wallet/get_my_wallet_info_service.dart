import 'package:dio/dio.dart';
import 'package:rideshare_/model/error/exception.dart';
import 'package:rideshare_/service/service.dart';

class GetMyWalletInfoService extends Service {
  GetMyWalletInfoService(super.dio);

  Future<Response> getMyWalletInfoService() async {
    try {
      response = await dio.get("$baseUrl/api/v1/wallet", options: options);
      return response;
    } on DioException catch (e) {
      if (e.response!.data['message'] == "PLEASE CREATE WALLET FIRST") {
        throw NoWallet();
      } else {
        rethrow;
      }
    }
  }
}
