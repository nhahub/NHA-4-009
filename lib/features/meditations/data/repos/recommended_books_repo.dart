import 'package:moodly/core/constants/app_keys.dart';
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
    // Try to get data from cache first
    final List<BookModel>? recommendedCachedBooks =
        await _recommendedBooksLocalService.getRecommendedBooks();

    if (recommendedCachedBooks != null && recommendedCachedBooks.isNotEmpty) {
      return recommendedCachedBooks;
    }

    //  No data in cache, fetch from remote
    final BooksResponse booksResponse = await _recommendedBooksRemoteService
        .getRecommendedBooks(
          subject: "psychology+anxiety",
          maxResults: 6,
          key: ApiKeys.googleBooksApiKey,
        );

    await _recommendedBooksLocalService.cacheRecommendedBooks(
      recommendedBooks: booksResponse.items!,
    );

    return booksResponse.items!;
  }
}
