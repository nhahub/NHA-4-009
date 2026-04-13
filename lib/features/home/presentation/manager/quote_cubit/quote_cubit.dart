import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/models/quote/quote_model.dart';
import '../../../data/repos/quote_repo.dart';

part 'quote_state.dart';

class QuoteCubit extends Cubit<QuoteState> {
  final QuoteRepo _quoteRepo;
  QuoteCubit({required QuoteRepo quoteRepo})
    : _quoteRepo = quoteRepo,
      super(QuoteLoadingState());

  void getQuoteOfTheDay() async {
    final Either<Failure, QuoteModel> response = await _quoteRepo
        .getQuoteOfTheDay();
    response.fold(
      (failure) {
        emit(QuoteFailureState(errorMessage: failure.message));
      },
      (quoteModel) {
        emit(QuoteSuccessLoadedState(quoteModel: quoteModel));
      },
    );
  }
}
