import 'package:flutter/material.dart';

class StarRatingComponent extends StatelessWidget {
  final int rating;
  final double size;

  const StarRatingComponent({
    super.key,
    required this.rating,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) => Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: size * 0.8,
        ),
      ),
    );
  }
}