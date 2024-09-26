// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:rideshare_/features/bicycles/data/model/bicycle_by_hub_model.dart'
    as byHub;
import 'package:rideshare_/features/bicycles/data/model/bicycle_respond_model.dart';
import 'package:rideshare_/core/error/exception.dart';
import 'package:rideshare_/features/bicycles/data/sources/remote/get_all_bicycle_service.dart';

class GetAllBicyclesRepo {
  final GetAllBicycleService getAllBicycleService;
  GetAllBicyclesRepo({
    required this.getAllBicycleService,
  });

  Future<BicycleModel> getAllBicyclesRepo() async {
    try {
      var data = await getAllBicycleService.getAllBicycleservice();
      BicycleRespondModel bicycelResponse =
          BicycleRespondModel.fromMap(data.data as Map<String, dynamic>);

      return bicycelResponse;
    } on EmptyBicycleRespons {
      return EmptyBicycleRespondModel(message: 'There is No Bicycle to Show');
    } catch (e) {
      return ExceptionBicycleRespondModel(message: e.toString());
    }
  }

  Future<byHub.BicycleByHubModel> getAllBicyclesByHubRepo(
      int id, String bicycleCategory) async {
    try {
      var data = await getAllBicycleService.getAllBicycleByHubservice(
          id, bicycleCategory);
      byHub.BicycleByHubRespondModel bicycelResponse =
          byHub.BicycleByHubRespondModel.fromJson(data.toString());
      return bicycelResponse;
    } on DioException catch (e) {
      return byHub.ExceptionBicycleRespondModel(
          message: e.response!.data['message']);
    }
  }
}
