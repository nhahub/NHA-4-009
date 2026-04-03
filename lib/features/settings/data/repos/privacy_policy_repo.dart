import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../models/legal_data_model.dart';
import '../services/privacy_policy_local_service.dart';

class PrivacyPolicyRepo {
  final PrivacyPolicyLocalService privacyPolicyLocalService;

  PrivacyPolicyRepo({required this.privacyPolicyLocalService});

  Future<Either<Failure, List<LegalDataModel>>> getPrivacyPolicy() async {
    try {
      final data = await privacyPolicyLocalService.getPrivacyPolicy();
      return right(data);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }
}
