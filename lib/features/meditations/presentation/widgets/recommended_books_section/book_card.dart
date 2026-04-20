import 'package:flutter/material.dart';
import 'package:moodly/features/meditations/data/models/book_model.dart';

class BookCard extends StatelessWidget {
  final BookModel book;
  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 164,
      height: 254,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[50],
      ),
    );
  }
}
