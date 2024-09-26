import 'package:dio/dio.dart';
import 'package:rideshare_/features/auth/data/model/Login_model.dart';
import 'package:rideshare_/features/auth/data/model/login_respond.dart';
import 'package:rideshare_/core/resources/shared_prefrences/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  Future<LoginRespond> loginService(LoginModel user) async {
    try {
      Dio dio = Dio();
      String baseUrl = "https://rideshare_.devscape.online";
      Options options = Options(
        headers: {
          'Accept': '*/*',
          'Content-Type': 'application/json',
        },
      );
      Response response = await dio.post(
        "$baseUrl/api/v1/auth/authenticate",
        data: user.toMap(),
        options: options,
      );
      if (response.statusCode == 200) {
        LoginToken info = LoginToken.fromMap(response.data);

        storage.get<SharedPreferences>().setBool("auth", true);
        storage.get<SharedPreferences>().setInt("id", info.body.id);
        storage.get<SharedPreferences>().setString("phone", info.body.phone);
        storage.get<SharedPreferences>().setString("token", info.body.token);
        storage
            .get<SharedPreferences>()
            .setString("firstName", info.body.firstName);

        return LoginToken.fromMap(response.data);
      } else {
        return LoginErrorRespond(message: 'lol');
      }
    } on DioException catch (e) {
      if (e.response!.data["status"] == "BAD_REQUEST") {
        return LoginErrorRespond(message: e.response!.data["message"]);
      } else {
        return LoginErrorRespond(message: e.message.toString());
      }
    }
  }
}
