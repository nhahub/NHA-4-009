import 'package:moodly/features/home/data/services/quotes_local_service.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/services/cache_helper.dart';
import '../models/quote_model.dart';

class QuoteRepo {
  final QuotesLocalService quotesLocalService;

  QuoteRepo({required this.quotesLocalService});

  Future<QuoteModel> getQuoteOfTheDay() async {
    final List<QuoteModel> quotes = await quotesLocalService.getQuotes();

    final cachedQuote = _getCachedQuote(quotes);
    if (cachedQuote != null) return cachedQuote;

    final quote = _generateTodayQuote(quotes);

    await _cacheQuote(quote);

    return quote;
  }

  QuoteModel? _getCachedQuote(List<QuoteModel> quotes) {
    final todayString = _getTodayString();

    final savedDate = CacheHelper.getString(key: kQuoteDate);
    final savedId = CacheHelper.getInt(key: kQuoteId);

    if (savedDate == todayString) {
      return quotes.firstWhere(
        (q) => q.id == savedId,
        orElse: () => quotes.first,
      );
    }

    return null;
  }

  QuoteModel _generateTodayQuote(List<QuoteModel> quotes) {
    final today = DateTime.now();
    final index = _generateIndex(today, quotes.length);
    return quotes[index];
  }

  int _generateIndex(DateTime today, int length) {
    final startDate = DateTime(2026, 1, 1);
    return today.difference(startDate).inDays % length;
  }

  Future<void> _cacheQuote(QuoteModel quote) async {
    await CacheHelper.set(key: kQuoteId, value: quote.id);
    await CacheHelper.set(key: kQuoteDate, value: _getTodayString());
  }

  String _getTodayString() {
    final today = DateTime.now();
    return "${today.year}-${today.month}-${today.day}";
  }
}
