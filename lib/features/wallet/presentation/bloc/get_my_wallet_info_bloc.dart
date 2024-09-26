import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rideshare_/features/wallet/data/model/my_wallet_info_model.dart';
import 'package:rideshare_/features/wallet/data/repository/get_my_wallet_info_repo.dart';

part 'get_my_wallet_info_event.dart';
part 'get_my_wallet_info_state.dart';

class GetMyWalletInfoBloc
    extends Bloc<GetMyWalletInfoEvent, GetMyWalletInfoState> {
  final GetMyWalletInfoRepo getMyWalletInfoRepo;
  GetMyWalletInfoBloc(this.getMyWalletInfoRepo)
      : super(GetMyWalletInfoInitial()) {
    on<GetInfo>((event, emit) async {
      var data = await getMyWalletInfoRepo.getMyWalletInfoRepo();
      if (data is GettingMyWalletInfo) {
        emit(SuccessGettingMyWalletInfo(walletInfoModel: data));
      } else if (data is ExceptionMyWalletInfo) {
        emit(ExceptionGettingMyWalletInfo(message: data.message));
      } else if (data is NoWalletToShow) {
        emit(NoWalletToShowState(message: data.message));
      } else {
        emit(LoadingGettingMyWalletInfo());
      }
    });
  }
}
