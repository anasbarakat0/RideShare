// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:rideshare_/core/error/exception.dart';
import 'package:rideshare_/features/wallet/data/model/my_wallet_info_model.dart';
import 'package:rideshare_/features/wallet/data/sources/remote/get_my_wallet_info_service.dart';

class GetMyWalletInfoRepo {
  final GetMyWalletInfoService getMyWalletInfoService;
  GetMyWalletInfoRepo({
    required this.getMyWalletInfoService,
  });

  Future<MyWalletInfoModel> getMyWalletInfoRepo() async {
    try {
      var data = await getMyWalletInfoService.getMyWalletInfoService();

      return GettingMyWalletInfo.fromMap(data.data);
    } on NoWallet {
      return NoWalletToShow(message: 'No Wallet to Show');
    } on DioException catch (e) {
      return ExceptionMyWalletInfo(message: e.response!.data.toString());
    }
  }
}
