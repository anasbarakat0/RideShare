import 'package:dio/dio.dart';
import 'package:rideshare_/model/error/exception.dart';
import 'package:rideshare_/model/wallet/wallet_codes_model.dart';
import 'package:rideshare_/service/service.dart';

class AddMoneyToMyWalletService extends Service {
  AddMoneyToMyWalletService(super.dio);

  Future<Response> addMoneyToMyWalletService(String code) async {
    try {
      final response = await dio.put("$baseUrl/api/v1/wallet",
          options: options, data: {'code': code});
      return response;
    } on DioException catch (e) {
      if (e.response!.data['message'] == "CODE NOT CORRECT") {
        throw CodeNotCorrect(
            unValidCodeModel: UnValidCodeModel.fromMap(e.response!.data));
      } else {
        rethrow;
      }
    }
  }
}
