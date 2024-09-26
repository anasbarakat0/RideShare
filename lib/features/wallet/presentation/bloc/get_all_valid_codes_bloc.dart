import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rideshare_/features/wallet/data/model/get_codes_model.dart';
import 'package:rideshare_/features/wallet/data/repository/get_all_valid_codes_repo.dart';

part 'get_all_valid_codes_event.dart';
part 'get_all_valid_codes_state.dart';

class GetAllValidCodesBloc
    extends Bloc<GetAllValidCodesEvent, GetAllValidCodesState> {
  final GetAllValidCodesRepo getAllValidCodesRepo;
  GetAllValidCodesBloc(this.getAllValidCodesRepo)
      : super(GetAllValidCodesInitial()) {
    on<GetCodes>((event, emit) async {
      var data = await getAllValidCodesRepo.getAllValidCodesRepo();
      if (data is GetValidCodes) {
        emit(GettingValidCodes(getValidCodes: data));
      } else if (data is GetNoCodes) {
        emit(GettingNoCode(getNoCodes: data));
      } else if (data is ExceptionGettingCodes) {
        emit(ExceptionWhileGettingCodes(exceptionGettingCodes: data));
      } else {
        emit(LoadingGettingCodes());
      }
    });
  }
}
