import 'package:dio/dio.dart';
import 'package:rideshare_/core/error/exception.dart';
import 'package:rideshare_/features/wallet/data/model/create_new_wallet_model.dart';
import 'package:rideshare_/temp/service/service.dart';

class CreateNewWalletService extends Service {
  CreateNewWalletService(super.dio);

  Future<Response> createNewWallet(CreateNewWalletModel wallet) async {
    try {
      response = await dio.post("$baseUrl/api/v1/wallet",
          options: options, data: wallet.toMap());
      return response;
    } on DioException catch (e) {
      if (e.response!.data['status'] == "BAD_REQUEST") {
        throw BadRequest.fromMap(e.response!.data);
      } else {
        rethrow;
      }
    }
  }
}
