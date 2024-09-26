// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:rideshare_/core/error/exception.dart';
import 'package:rideshare_/features/wallet/data/model/create_new_wallet_model.dart';
import 'package:rideshare_/features/wallet/data/model/create_new_wallet_response_model.dart';
import 'package:rideshare_/features/wallet/data/sources/remote/create_new_wallet_service.dart';

class CreateNewWalletRepo {
  final CreateNewWalletService createNewWalletService;
  CreateNewWalletRepo({
    required this.createNewWalletService,
  });

  Future<CreateNewWalletResponseModel> createNewWalletRepo(
      CreateNewWalletModel wallet) async {
    try {
      var data = await createNewWalletService.createNewWallet(wallet);

      return WalletCreated.fromMap(data.data);
    } on BadRequestWallet catch (e) {
      return e.badRequestCreateWallet;
    } on DioException catch (e) {
      return ExceptionCreateWalletModel(message: e.response!.data);
    } catch (e) {
      rethrow;
    }
  }
}
