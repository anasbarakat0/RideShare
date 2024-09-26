import 'package:dio/dio.dart';
import 'package:rideshare_/features/settings/change_password/data/model/change_password_respond.dart';
import 'package:rideshare_/temp/service/service.dart';

class GetFavouriteService extends Service {
  GetFavouriteService(super.dio);

  Future<Response> getFavouriteService() async {
    try {
      response = await dio.get(
          "$baseUrl/api/v1/favourite-bicycles/clientFavourite",
          options: options);
      return response;
    } on DioException catch (e) {
      if (e.response!.data["status"] == "BAD_REQUEST") {
        throw BadRequest.fromMap(e.response!.data);
      } else {
        rethrow;
      }
    }
  }
}
