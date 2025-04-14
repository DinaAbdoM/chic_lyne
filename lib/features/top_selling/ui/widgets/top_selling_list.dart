import 'package:chic_lyne/features/top_selling/domain/entities/top_selling_product.dart';
import 'package:chic_lyne/features/top_selling/ui/widgets/top_selling_item.dart';
import 'package:flutter/material.dart';

class TopSellingList extends StatelessWidget {
  final List<TopSellingProduct> products;
  final double itemHeight;
  final double itemWidth;

  const TopSellingList({
    super.key,
    required this.products,
    required this.itemHeight,
    required this.itemWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: itemHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return TopSellingItem(
            product: products[index],
            itemHeight: itemHeight,
            itemWidth: itemWidth,
          );
        },
      ),
    );
  }
}