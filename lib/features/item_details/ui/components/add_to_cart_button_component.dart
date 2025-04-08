import 'package:chic_lyne/core/di/dependency_injection.dart';
import 'package:chic_lyne/features/carts/data/models/cart_model.dart';
import 'package:chic_lyne/features/carts/domain/entities/cart.dart';
import 'package:chic_lyne/features/carts/logic/bloc/cart_bloc.dart';
import 'package:chic_lyne/features/carts/logic/cubit/cart_cubit.dart';
import 'package:chic_lyne/features/carts/ui/cart_view.dart';
import 'package:chic_lyne/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddToBagButtonComponent extends StatelessWidget {
  final double padding;
  final double fontSize;
  final double price;
  final int quantity;
  final CartModel cartModelProduct;

  const AddToBagButtonComponent({
    super.key,
    required this.padding,
    required this.fontSize,
    required this.price,
    required this.quantity,
     required this.cartModelProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () async {
            try {
              final cartCubit = getIt<CartBloc>();
              // final cartProduct = Product(
              //   id: product.id ?? 0,
              //   title: product.title ?? '',
              //   price: (product.price ?? 0).toInt(),
              //   quantity: quantity,
              //   total: ((product.price ?? 0) * quantity).toInt(),
              //   discountPercentage: product.discountPercentage ?? 0.0,
              //   discountedPrice:
              //       ((product.price ?? 0) *
              //               (1 - (product.discountPercentage ?? 0) / 100) *
              //               quantity)
              //           .toInt(),
              //   thumbnail: product.thumbnail ?? '',
              // );

              // await cartCubit.addProduct(cartProduct);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => BlocProvider.value(
                        value: cartCubit,
                        child: const CartView(),
                      ),
                ),
              );
            } catch (e) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Error: ${e.toString()}')));
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple[400],
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.r),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Add to Bag",
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 30.w),
              Text(
                "\$${((price ?? 0) * quantity).toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
