import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/errors/failure.dart';
import '../../../data/models/legal_data_model.dart';
import '../../../data/repos/privacy_policy_repo.dart';

part 'privacy_policy_state.dart';

class PrivacyPolicyCubit extends Cubit<PrivacyPolicyState> {
  final PrivacyPolicyRepo privacyPolicyRepo;

  PrivacyPolicyCubit({required this.privacyPolicyRepo})
    : super(PrivacyPolicyLoadingState());

  Future<void> getPrivacyPolicy() async {
    final Either<Failure, List<LegalDataModel>> result = await privacyPolicyRepo
        .getPrivacyPolicy();

    result.fold(
      (failure) => emit(PrivacyPolicyFailureState(message: failure.message)),
      (data) => emit(PrivacyPolicyLoadedState(data: data)),
    );
  }
}
