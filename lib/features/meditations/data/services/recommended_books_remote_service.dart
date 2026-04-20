import 'package:dio/dio.dart';
import 'package:moodly/features/meditations/data/models/book_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
part 'recommended_books_remote_service.g.dart';

@RestApi(baseUrl: ApiConstants.googleBooksBaseUrl)
abstract class RecommendedBooksRemoteService {
  factory RecommendedBooksRemoteService(Dio dio) =
      _RecommendedBooksRemoteService;

  @GET(ApiConstants.getRecommendedBooks)
  Future<List<BookModel>> getRecommendedBooks();
}
