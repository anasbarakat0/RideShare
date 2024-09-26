import 'package:rideshare_/model/error/exception.dart';
import 'package:rideshare_/model/authentication/sign_up_model.dart';
import 'package:rideshare_/model/authentication/sign_up_respond_model.dart';
import 'package:rideshare_/service/auth/sign_up_service.dart';

class SignUpRepo {
  final SignUpService signUpService;
  SignUpRepo({
    required this.signUpService,
  });

  Future<SignUpRespondModel> signUp(SignUpModel user) async {
    try {
      var data = await signUpService.signUpService(user);

      return SuccessRespond(token: data.data['body']['token']);
    } on UsernameAlreadyInUse {
      return ErrorRespond(message: 'username already in use');
    } on BadRequestSignUp catch (e) {
      return SignUpBadRequest(message: e.messages);
    } catch (e) {
      return ExceptionRespond(message: e.toString());
    }
  }
}
