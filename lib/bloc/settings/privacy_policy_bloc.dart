import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rideshare_/model/Settings/privacy_policy_model.dart';
import 'package:rideshare_/service/settings/privacy_policy_service.dart';

part 'privacy_policy_event.dart';
part 'privacy_policy_state.dart';

class PrivacyPolicyBloc extends Bloc<PrivacyPolicyEvent, PrivacyPolicyState> {
  final PrivacyPolicyService privacyPolicyService;
  PrivacyPolicyBloc(this.privacyPolicyService) : super(PrivacyPolicyInitial()) {
    on<SeePolicy>((event, emit) async {
      var data = await privacyPolicyService.privacyPolicyService();
      if (data is PrivacyPolicyModel) {
        emit(SuccessGettingPolicy(privacyPolicyModel: data));
      } else if (data is ExceptionPrivacyPolicy) {
        emit(ExceptionGettingPolicy(message: data.message));
      } else {
        emit(LoadingGettingPolicy());
      }
    });
  }
}
