import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rideshare_/model/Settings/change_password_model.dart';
import 'package:rideshare_/model/Settings/change_password_respond.dart';
import 'package:rideshare_/repo/settings/change_password_repo.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final ChangePasswordRepo changePasswordRepo;
  ChangePasswordBloc(this.changePasswordRepo) : super(ChangePasswordInitial()) {
    on<ChangePassword>((event, emit) async {
      ChangePasswordRespond data = await changePasswordRepo
          .changePasswordRepo(event.changePasswordModel);
      if (data is SuccessChangingResponse) {
        emit(SuccessChanging(message: data.message!));
      } else if (data is BadRequest) {
        emit(BadRequestChanging(badRequest: data));
      } else {
        emit(LoadingChanging());
      }
    });
  }
}
