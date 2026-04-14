import '../models/legal_data_model.dart';
import '../services/privacy_policy_local_service.dart';

class PrivacyPolicyRepo {
  final PrivacyPolicyLocalService _privacyPolicyLocalService;

  PrivacyPolicyRepo({
    required PrivacyPolicyLocalService privacyPolicyLocalService,
  }) : _privacyPolicyLocalService = privacyPolicyLocalService;

  Future<List<LegalDataModel>> getPrivacyPolicy() async {
    final List<LegalDataModel> data = await _privacyPolicyLocalService
        .getPrivacyPolicy();
    return data;
  }
}
