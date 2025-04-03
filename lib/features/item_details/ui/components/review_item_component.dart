import 'package:chic_lyne/features/item_details/ui/components/star_rating_componet.dart';
import 'package:flutter/material.dart';

class ReviewItemComponent extends StatelessWidget {
  final String name;
  final int rating;
  final String imagePath;
  final String reviewText;
  final int daysAgo;
  final bool isSmallScreen;
  final double textSize;

  const ReviewItemComponent({
    super.key,
    required this.name,
    required this.rating,
    required this.imagePath,
    required this.reviewText,
    required this.daysAgo,
    required this.isSmallScreen,
    required this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    final avatarSize = isSmallScreen ? 16.0 : 20.0;
    final nameSize = isSmallScreen ? 12.0 : 14.0;
    final starSize = isSmallScreen ? 14.0 : 16.0;
    final dateSize = isSmallScreen ? 11.0 : 13.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: avatarSize,
              backgroundImage: AssetImage(imagePath),
            ),
            SizedBox(width: isSmallScreen ? 8 : 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: nameSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                StarRatingComponent(rating: rating, size: starSize),
              ],
            ),
          ],
        ),
        SizedBox(height: isSmallScreen ? 6 : 8),
        Text(
          reviewText,
          style: TextStyle(
            fontSize: textSize,
            color: Colors.grey[700],
            height: 1.4,
          ),
        ),
        SizedBox(height: isSmallScreen ? 2 : 4),
        Text(
          "$daysAgo days ago",
          style: TextStyle(fontSize: dateSize, color: Colors.grey[500]),
        ),
      ],
    );
  }
}
