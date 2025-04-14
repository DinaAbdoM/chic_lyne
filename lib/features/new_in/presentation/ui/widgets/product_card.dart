// import 'package:chic_lyne/features/new_in/domain/entities/product_entity.dart';
// import 'package:flutter/material.dart';

// class ProductCard extends StatelessWidget {
//   final ProductEntity product;

//   const ProductCard({super.key, required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.all(8.0),
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.network(
//               product.thumbnail,
//               height: 150,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//             const SizedBox(height: 8),
//             Text(
//               product.title,
//               style: Theme.of(context).textTheme.titleLarge,
//             ),
//             Text(product.brand),
//             const SizedBox(height: 8),
//             Text(
//               '\$${product.price.toStringAsFixed(2)}',
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Row(
//               children: [
//                 Icon(Icons.star, color: Colors.amber),
//                 Text(' ${product.rating.toStringAsFixed(1)}'),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chic_lyne/core/theming/styles.dart';
import 'package:chic_lyne/features/new_in/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;
  final double itemHeight;
  final double itemWidth;
  final double fontSize;

  const ProductCard({
    super.key,
    required this.product,
    required this.itemHeight,
    required this.itemWidth,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        width: itemWidth,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: product.thumbnail!,
                fit: BoxFit.cover,
                placeholder:
                    (context, url) => Container(color: Colors.grey[300]),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),

              // Image.network(
              //   product.thumbnail,
              //   fit: BoxFit.cover,
              //   height: itemHeight * 0.6,
              //   width: double.infinity,
              //   errorBuilder: (context, error, stackTrace) =>
              //       const Icon(Icons.error_outline, size: 50),
              // ),
            ),
            const Spacer(flex: 2),
            Text(
              product.title,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 1,
            ),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
