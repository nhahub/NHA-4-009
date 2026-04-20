import 'package:moodly/features/meditations/data/models/book_model.dart';
import 'package:moodly/features/meditations/data/services/recommended_books_local_service.dart';

import '../services/recommended_books_remote_service.dart';

class RecommendedBooksRepo {
  final RecommendedBooksRemoteService _recommendedBooksRemoteService;
  final RecommendedBooksLocalService _recommendedBooksLocalService;

  RecommendedBooksRepo({
    required RecommendedBooksRemoteService recommendedBooksRemoteService,
    required RecommendedBooksLocalService recommendedBooksLocalService,
  }) : _recommendedBooksRemoteService = recommendedBooksRemoteService,
       _recommendedBooksLocalService = recommendedBooksLocalService;

  Future<List<BookModel>> getRecommendedBooks() async {
    final List<BookModel> books = _recommendedBooksLocalService
        .getRecommendedBooks();

    if (books.isNotEmpty) {
      return books;
    }

    final List<BookModel> remoteBooks = await _recommendedBooksRemoteService
        .getRecommendedBooks();
    return remoteBooks;
  }
}
