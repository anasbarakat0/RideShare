import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rideshare_/model/wallet/wallet_codes_model.dart';
import 'package:rideshare_/repo/wallet/add_money_to_my_wallet_repo.dart';

part 'add_money_to_my_wallet_event.dart';
part 'add_money_to_my_wallet_state.dart';

class AddMoneyToMyWalletBloc
    extends Bloc<AddMoneyToMyWalletEvent, AddMoneyToMyWalletState> {
  final AddMoneyToMyWalletRepo addMoneyToMyWalletRepo;
  AddMoneyToMyWalletBloc(this.addMoneyToMyWalletRepo)
      : super(AddMoneyToMyWalletInitial()) {
    on<AddMoney>((event, emit) async {
      var data =
          await addMoneyToMyWalletRepo.addMoneyToMyWalletRepo(event.code);
      if (data is ValidCodesModel) {
        emit(SuccessAddingMoney(validCodesModel: data));
      } else if (data is UnValidCodeModel) {
        emit(UnvalidForAddingMoney(unValidCodeModel: data));
      } else if (data is ExceptionCode) {
        emit(ExceptioAddingMoney(exceptionCode: data));
      } else {
        emit(LoadingAddingMoney());
      }
    });
  }
}
