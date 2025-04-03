import 'package:chic_lyne/features/search_view/data/models/search_products_models.dart';
import 'package:flutter/material.dart';

class ResultItem extends StatelessWidget {
  final List<Product>? products;

  const ResultItem({super.key, this.products});

  @override
  Widget build(BuildContext context) {
    if (products == null || products!.isEmpty) {
      return const Center(child: Text('No products found.'));
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        final itemWidth = constraints.maxWidth / 2;
        final itemHeight = screenWidth * 0.6;
        final fontSize = screenWidth * 0.03;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: screenWidth > 600 ? 3 : 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 2.0,
            childAspectRatio: (itemWidth / itemHeight),
          ),
          itemCount: products!.length,
          itemBuilder: (context, index) {
            final product = products![index];
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.grey[200],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 6,
                          child: Image.network(
                            product.thumbnail ?? '',
                            fit: BoxFit.fill,
                            width: double.infinity,
                          ),
                        ),
                        const Spacer(flex: 1),
                        Text(
                          product.title ?? '',
                          style: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '\$${product.price.toString() ?? '0.00'}',
                          style: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: const Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
