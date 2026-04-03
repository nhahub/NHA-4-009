part of 'terms_cubit.dart';

sealed class TermsState extends Equatable {
  const TermsState();

  @override
  List<Object> get props => [];
}

class TermsLoadingState extends TermsState {}

class TermsLoadedState extends TermsState {
  final List<LegalDataModel> data;

  const TermsLoadedState({required this.data});

  @override
  List<Object> get props => [data];
}

class TermsFailuerState extends TermsState {
  final String message;

  const TermsFailuerState({required this.message});

  @override
  List<Object> get props => [message];
}
