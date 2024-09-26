// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:rideshare_/model/Settings/change_password_model.dart';
import 'package:rideshare_/model/Settings/change_password_respond.dart';
import 'package:rideshare_/service/settings/change_password_service.dart';

class ChangePasswordRepo {
  final ChangePasswordService service;
  ChangePasswordRepo({
    required this.service,
  });

  Future<ChangePasswordRespond> changePasswordRepo(
      ChangePasswordModel passwordRepo) async {
    try {
      var data = await service.changePasswordService(passwordRepo);

      return SuccessChangingResponse(message: data.data);
    } on DioException catch (e) {
      if (e.response!.data["status"] == "BAD_REQUEST") {
        return BadRequest.fromMap(e.response!.data);
      } else {
        return BadRequest(
            message: "message",
            status: "status",
            localDateTime: "localDateTime");
      }
    }
  }
}
