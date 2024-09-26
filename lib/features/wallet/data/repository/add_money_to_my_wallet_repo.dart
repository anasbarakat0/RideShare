// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:rideshare_/core/error/exception.dart';
import 'package:rideshare_/features/wallet/data/model/wallet_codes_model.dart';
import 'package:rideshare_/features/wallet/data/sources/remote/add_money_to_my_wallet_service.dart';

class AddMoneyToMyWalletRepo {
  final AddMoneyToMyWalletService addMoneyToMyWalletService;
  AddMoneyToMyWalletRepo({
    required this.addMoneyToMyWalletService,
  });

  Future<WalletCodesModel> addMoneyToMyWalletRepo(String code) async {
    try {
      var data =
          await addMoneyToMyWalletService.addMoneyToMyWalletService(code);
      return ValidCodesModel.fromMap(data.data);
    } on CodeNotCorrect catch (e) {
      return e.unValidCodeModel;
    } catch (e) {
      return ExceptionCode(message: e.toString());
    }
  }
}