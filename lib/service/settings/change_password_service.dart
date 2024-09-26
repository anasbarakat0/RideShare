import 'package:dio/dio.dart';
import 'package:rideshare_/model/Settings/change_password_model.dart';
import 'package:rideshare_/service/service.dart';

class ChangePasswordService extends Service {
  ChangePasswordService(super.dio);

  Future<Response> changePasswordService(
      ChangePasswordModel userPassword) async {
    try {
      Map<String, dynamic> passwordMap = userPassword.toMap();

      response = await dio.put(
        '$baseUrl/api/v1/users/change-password',
        options: options,
        data: passwordMap,
      );
      return response;
    } on DioException {
      rethrow;
    }
  }
}
