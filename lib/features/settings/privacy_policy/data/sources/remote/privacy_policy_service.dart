import 'package:dio/dio.dart';
import 'package:rideshare_/temp/model/Settings/privacy_policy_model.dart';
import 'package:rideshare_/temp/service/service.dart';

class PrivacyPolicyService extends Service {
  PrivacyPolicyService(super.dio);

  Future<PrivacyPolicy> privacyPolicyService() async {
    try {
      response = await dio.get(
        "$baseUrl/api/v1/policy",
        options: options,
      );

      return PrivacyPolicyModel.fromMap(response.data);
    } on DioException catch (e) {
      return ExceptionPrivacyPolicy(message: "${e.response!}");
    }
  }
}
