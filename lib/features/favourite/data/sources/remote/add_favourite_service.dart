import 'package:dio/dio.dart';
import 'package:rideshare_/features/settings/change_password/data/model/change_password_respond.dart';
import 'package:rideshare_/temp/service/service.dart';

class AddFavouriteService extends Service {
  AddFavouriteService(super.dio);

  Future<Response> addFavouriteService(int id) async {
    try {
      response = await dio.post("$baseUrl/api/v1/favourite-bicycles",
          options: options, data: {"bicycleId": id});

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
