part of 'recommended_books_cubit.dart';

sealed class RecommendedBooksState extends Equatable {
  const RecommendedBooksState();

  @override
  List<Object?> get props => [];
}

class RecommendedBooksLoadingState extends RecommendedBooksState {}

class RecommendedBooksLoadedState extends RecommendedBooksState {
  final List<BookModel> recommendedBooks;

  const RecommendedBooksLoadedState({required this.recommendedBooks});

  @override
  List<Object?> get props => [recommendedBooks];
}

class RecommendedBooksFailureState extends RecommendedBooksState {
  final String message;
  const RecommendedBooksFailureState({required this.message});

  @override
  List<Object?> get props => [message];
}
