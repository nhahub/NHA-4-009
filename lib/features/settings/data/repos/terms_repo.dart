import '../models/legal_data_model.dart';
import '../services/terms_local_service.dart';

class TermsRepo {
  final TermsLocalService _termsLocalService;

  TermsRepo({required TermsLocalService termsLocalService})
    : _termsLocalService = termsLocalService;

  Future<List<LegalDataModel>> getTerms() async {
    final List<LegalDataModel> data = await _termsLocalService.getTerms();
    return data;
  }
}
