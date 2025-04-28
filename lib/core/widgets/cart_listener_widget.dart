import 'package:chic_lyne/features/carts/logic/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartListenerWidget extends StatelessWidget {
  const CartListenerWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        }

        if (state is RemoveFromCartState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Item removed from cart successfully'),
              backgroundColor: Colors.green,
            ),
          );
        }

        if (state is ClearCartState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Cart cleared successfully'),
              backgroundColor: Colors.green,
            ),
          );
        }

        if (state is UpdateProductQuantityState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Quantity updated successfully'),
              backgroundColor: Colors.green,
            )
          );
        }
        if (state is AddToCartState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Item added to cart successfully'),
              backgroundColor: Colors.green,
            ),
          );
        }
      },
      child: child,
    );
  }
}
