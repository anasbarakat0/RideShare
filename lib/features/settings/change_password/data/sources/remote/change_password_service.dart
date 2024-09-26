import 'package:dio/dio.dart';
import 'package:rideshare_/features/settings/change_password/data/model/change_password_model.dart';
import 'package:rideshare_/temp/service/service.dart';

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
