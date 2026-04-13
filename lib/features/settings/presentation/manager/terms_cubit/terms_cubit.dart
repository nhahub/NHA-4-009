import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/models/legal_data_model.dart';
import '../../../data/repos/terms_repo.dart';

part 'terms_state.dart';

class TermsCubit extends Cubit<TermsState> {
  final TermsRepo _termsRepo;

  TermsCubit({required TermsRepo termsRepo})
    : _termsRepo = termsRepo,
      super(TermsLoadingState());

  Future<void> getTerms() async {
    final Either<Failure, List<LegalDataModel>> result = await _termsRepo
        .getTerms();
    result.fold(
      (failure) => emit(TermsFailuerState(message: failure.message)),
      (data) => emit(TermsLoadedState(data: data)),
    );
  }
}
