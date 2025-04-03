import 'package:chic_lyne/features/favourit_items/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteItemView extends StatelessWidget {
  final List<Product> favoriteProducts = [
    Product(name: 'Nike Fuel Pack', price: 32.00),
    Product(name: 'Nike Show X Rush', price: 204.00),
    Product(name: 'Mens T-Shirt', price: 46.00),
    Product(name: 'Mens Skate T-Shirt', price: 46.00),
  ];

  FavoriteItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 16.h),
            Expanded(
              child: ListView.separated(
                itemCount: favoriteProducts.length,
                separatorBuilder: (context, index) => SizedBox(height: 16.h),
                itemBuilder: (context, index) {
                  return ProductCard(product: favoriteProducts[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoritesHeader extends StatelessWidget {
  const FavoritesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'My Favourites (12)',
      style: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

