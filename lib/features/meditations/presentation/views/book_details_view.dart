import 'package:flutter/material.dart';
import '../../../../core/constants/constants.dart';
import '../../data/models/book_model.dart';
import '../../../home/presentation/widgets/shared/back_button_appbar.dart';
import '../widgets/recommended_books_section/book_authors.dart';
import '../widgets/recommended_books_section/book_description.dart';
import '../widgets/recommended_books_section/book_image.dart';
import '../widgets/recommended_books_section/book_rating.dart';
import '../widgets/recommended_books_section/book_title.dart';

class BookDetailsView extends StatelessWidget {
  final BookModel book;
  const BookDetailsView({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackButtonAppbar(title: "Book details"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 10),
                BookImage(
                  imageUrl:
                      book.volumeInfo?.imageLinks?.thumbnail ??
                      kImagePlaceHolder,
                ),
                const SizedBox(height: 20),
                BookTitle(title: book.volumeInfo?.title ?? ""),
                const SizedBox(height: 5),
                BookAuthors(authors: book.volumeInfo!.authors!),
                const SizedBox(height: 5),
                BookRating(
                  rating: book.volumeInfo?.averageRating.toString() ?? "0",
                ),
                const SizedBox(height: 15),
                BookDescription(
                  description: book.volumeInfo?.description.toString() ?? "",
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
