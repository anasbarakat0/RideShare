// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:rideshare_/model/error/exception.dart';
import 'package:rideshare_/model/hubs/get_all_hubs_response_model.dart';
import 'package:rideshare_/service/hubs/get_all_hubs_service.dart';

class GetAllHubsRepo {
  final GetAllHubsService getAllHubsService;
  GetAllHubsRepo({
    required this.getAllHubsService,
  });
  Future<GetAllHubsResponseModel> getAllHubsRepo(double lan, double lat) async {
    try {
      var data = await getAllHubsService.getAllHubsService(lan, lat);
      return SuccessResponse.fromMap(data.data);
    } on EmptyHubs {
      return EmptyResponse(message: 'There is no hubs around');
    } on DioException {
      return ExceptionResponse(message: "Server Error");
    } catch (e) {
      return ExceptionResponse(message: 'Failed to get hubs');
    }
  }
}
