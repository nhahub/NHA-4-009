part of 'quote_cubit.dart';

sealed class QuoteState extends Equatable {
  const QuoteState();

  @override
  List<Object> get props => [];
}

class QuoteLoadingState extends QuoteState {}

class QuoteSuccessLoadedState extends QuoteState {
  final QuoteModel quoteModel;
  const QuoteSuccessLoadedState({required this.quoteModel});

  @override
  List<Object> get props => [quoteModel];
}

class QuoteFailureState extends QuoteState {
  final String errorMessage;
  const QuoteFailureState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
