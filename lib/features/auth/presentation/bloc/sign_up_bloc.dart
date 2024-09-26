import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rideshare_/features/auth/data/model/sign_up_model.dart';
import 'package:rideshare_/features/auth/data/model/sign_up_respond_model.dart';
import 'package:rideshare_/features/auth/data/repository/sign_up_repo.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpRepo signUpRepo;
  SignUpBloc(this.signUpRepo) : super(SignUpInitial()) {
    on<SignUpUser>((event, emit) async {
      var data = await signUpRepo.signUp(event.user);
      if (data is SuccessRespond) {
        emit(Success());
      } else if (data is ErrorRespond) {
        emit(Error(message: data.message));
      } else if (data is SignUpBadRequest) {
        emit(Exception(message: data.message));
      } else if (data is ExceptionRespond) {
        emit(Error(message: ' ${data.message}'));
      } else {
        emit(Loading());
      }
    });
  }
}
