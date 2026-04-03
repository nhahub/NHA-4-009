import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../models/legal_data_model.dart';
import '../services/terms_local_service.dart';

class TermsRepo {
  final TermsLocalService termsLocalService;

  TermsRepo({required this.termsLocalService});

  Future<Either<Failure, List<LegalDataModel>>> getTerms() async {
    try {
      final data = await termsLocalService.getTerms();
      return right(data);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }
}
