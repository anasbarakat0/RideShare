import 'package:dio/dio.dart';
import 'package:rideshare_/model/authentication/login_respond.dart';
import 'package:rideshare_/model/error/exception.dart';
import 'package:rideshare_/model/authentication/sign_up_model.dart';
import 'package:rideshare_/service/shared_prefrences/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpService {
  Future<Response> signUpService(SignUpModel user) async {
    try {
      Dio dio = Dio();
      String baseUrl = "https://rideshare_.devscape.online";
      Map<String, dynamic> userMap = user.toMap();
      Options options = Options(
        headers: {
          'Accept': '*/*',
          'Content-Type': 'application/json',
        },
      );
      Response response = await dio.post('$baseUrl/api/v1/auth/register',
          options: options, data: userMap);
      LoginToken info = LoginToken.fromMap(response.data);

      storage.get<SharedPreferences>().setBool("auth", true);
      storage.get<SharedPreferences>().setInt("id", info.body.id);
      storage.get<SharedPreferences>().setString("phone", info.body.phone);
      storage.get<SharedPreferences>().setString("token", info.body.token);
      storage
          .get<SharedPreferences>()
          .setString("firstName", info.body.firstName);

      return response;
    } on DioException catch (e) {
      if (e.response!.data['message'] == 'username already in use') {
        throw UsernameAlreadyInUse();
      } else if (e.response!.data['message'] is List) {
        List<String> messages =
            List<String>.from(e.response!.data['message'][0].split(','));
        throw BadRequestSignUp(messages: messages);
      } else {
        rethrow;
      }
    }
  }
}
