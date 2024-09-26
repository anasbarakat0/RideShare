// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:rideshare_/core/error/exception.dart';
import 'package:rideshare_/features/wallet/data/model/get_codes_model.dart';
import 'package:rideshare_/features/wallet/data/sources/remote/get_all_valid_codes_service.dart';

class GetAllValidCodesRepo {
  final GetAllValidCodesService getAllValidCodesService;
  GetAllValidCodesRepo({
    required this.getAllValidCodesService,
  });

  Future<GetCodesModel> getAllValidCodesRepo() async {
    try {
      var data = await getAllValidCodesService.getAllValidCodesService();
      return GetValidCodes.fromMap(data.data);
    } on NoValidCode catch (e) {
      return e.getNoCodes;
    } on DioException catch (e) {
      return ExceptionGettingCodes(message: e.response!.data.toString());
    }
  }
}
