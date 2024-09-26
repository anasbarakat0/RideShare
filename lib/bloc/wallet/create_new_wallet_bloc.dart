import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rideshare_/model/wallet/create_new_wallet_model.dart';
import 'package:rideshare_/model/wallet/create_new_wallet_response_model.dart';
import 'package:rideshare_/repo/wallet/create_new_wallet_repo.dart';

part 'create_new_wallet_event.dart';
part 'create_new_wallet_state.dart';

class CreateNewWalletBloc
    extends Bloc<CreateNewWalletEvent, CreateNewWalletState> {
  final CreateNewWalletRepo createNewWalletRepo;
  CreateNewWalletBloc(this.createNewWalletRepo)
      : super(CreateNewWalletInitial()) {
    on<CreateNewWallet>((event, emit) async {
      var data = await createNewWalletRepo
          .createNewWalletRepo(event.createNewWalletModel);
      if (data is WalletCreated) {
        emit(SuccessCreateWallet(response: data));
      } else if (data is BadRequestCreateWalletModel) {
        emit(BadRequestCreateWallet(response: data));
      } else if (data is ExceptionCreateWalletModel) {
        emit(ExceptionCreateWallet(message: data));
      } else {
        emit(LoadingCreateWallet());
      }
    });
  }
}
