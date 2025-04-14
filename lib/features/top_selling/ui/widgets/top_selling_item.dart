// import 'package:chic_lyne/core/theming/styles.dart';
// import 'package:chic_lyne/features/top_selling/domain/entities/top_selling_product.dart';
// import 'package:flutter/material.dart';

// class TopSellingItem extends StatelessWidget {
//   final TopSellingProduct product;
//   final double itemHeight;
//   final double itemWidth;

//   const TopSellingItem({
//     super.key,
//     required this.product,
//     required this.itemHeight,
//     required this.itemWidth,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         padding: const EdgeInsets.all(8),
//         decoration: BoxDecoration(
//           color: Colors.grey[200],
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(8),
//               child: Image.network(
//                 product.thumbnail,
//                 fit: BoxFit.cover,
//                 height: itemHeight * 0.6,
//                 width: double.infinity,
//                 errorBuilder: (context, error, stackTrace) => Container(
//                   color: Colors.grey[300],
//                   height: itemHeight * 0.6,
//                   child: const Icon(Icons.error),
//                 ),
//               ),
//             ),
//             const Spacer(flex: 2),
//             Text(
//               product.title,
//               style: TextStyles.font14BlackBold,
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//             ),
//             Text(
//               '\$${product.price.toStringAsFixed(2)}',
//               style: TextStyles.font14BlackBold,
//             ),
//             if (product.discountPercentage > 0)
//               Text(
//                 '${product.discountPercentage}% OFF',
//                 style: TextStyles.font12RedBold,
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:chic_lyne/core/theming/styles.dart';
import 'package:chic_lyne/features/top_selling/domain/entities/top_selling_product.dart';
import 'package:flutter/material.dart';

class TopSellingItem extends StatelessWidget {
  final TopSellingProduct product;
  final double itemHeight;
  final double itemWidth;

  const TopSellingItem({
    super.key,
    required this.product,
    required this.itemHeight,
    required this.itemWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: itemWidth,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  height: itemHeight * 0.6,
                  width: double.infinity,
                  child: Image.network(
                    product.thumbnail,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (context, error, stackTrace) => Container(
                          color: Colors.grey[300],
                          child: const Center(child: Icon(Icons.error)),
                        ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                product.title,
                style: TextStyles.font14BlackBold,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: TextStyles.font14BlackBold,
              ),
              if (product.discountPercentage > 0) ...[
                const SizedBox(height: 2),
                Text(
                  '${product.discountPercentage.toStringAsFixed(0)}% OFF',
                  style: TextStyles.font12RedBold,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
