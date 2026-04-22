import '../book_model.dart';

class DummyBooks {
  static List<BookModel> dummyBooks = List.generate(
    5,
    (index) => BookModel(id: ""),
  );
}
