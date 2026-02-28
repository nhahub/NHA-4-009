import 'package:flutter/material.dart';

class TherapistImage extends StatelessWidget {
  final String image;

  const TherapistImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        image,
        fit: BoxFit.cover,
        height: 180.33,
        width: double.infinity,
      ),
    );
  }
}
