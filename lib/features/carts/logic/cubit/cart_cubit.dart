// import 'package:bloc/bloc.dart';
// import 'package:chic_lyne/core/utils/utils/cart_utils.dart';
// import 'package:chic_lyne/features/carts/data/models/cart_model.dart';
// import 'package:chic_lyne/features/carts/data/repo/cart_repo.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';

// part 'cart_state.dart';

// class CartCubit extends Cubit<CartState> {
//   final CartRepository repository;
//   final CartUtils cartUtils;

//   CartCubit({required this.repository, required this.cartUtils})
//     : super(const CartState());
// Future<void> addProduct(CartProduct product) async {
//   emit(state.copyWith(status: CartStatus.loading));
  
//   try {
//     // إذا كانت السلة فارغة، أنشئ سلة جديدة
//     if (state.cart == null) {
//       final newCart = await repository.createCart(
//         userId: 1, // أو أي معرّف مستخدم مناسب
//         products: [product],
//       );
//       emit(state.copyWith(
//         status: CartStatus.loaded,
//         cart: newCart,
//       ));
//     } 
//     // إذا كانت السلة موجودة، أضف المنتج إليها
//     else {
//       final updatedCart = await repository.addProductToCart(
//         cartId: state.cart!.id,
//         product: product,
//       );
//       emit(state.copyWith(
//         status: CartStatus.loaded,
//         cart: updatedCart,
//       ));
//     }
//   } catch (e) {
//     emit(state.copyWith(
//       status: CartStatus.error,
//       errorMessage: 'Failed to add product: ${e.toString()}',
//     ));
//   }
// }
//  Future<void> loadCart({int? cartId}) async {
//   emit(state.copyWith(status: CartStatus.loading));

//   try {
//     final effectiveCartId = cartId ?? state.cart?.id ?? 1;
//     final cart = await repository.getCart(cartId: effectiveCartId);

//     final products = cart.products;
//     final subtotal = cartUtils.calculateSubtotal(products);
//     final discount = cartUtils.calculateDiscount(products);
//     final shippingCost = cartUtils.calculateShipping(products);
//     final total = subtotal - discount + shippingCost;

//     emit(
//       state.copyWith(
//         status: CartStatus.loaded,
//         cart: cart,
//         subtotal: subtotal,
//         discount: discount,
//         shippingCost: shippingCost,
//         total: total,
//       ),
//     );
    
//   } catch (e) {
//     debugPrint('CartCubit Error: $e');
//     emit(
//       state.copyWith(
//         status: CartStatus.error,
//         errorMessage: 'Failed to load cart. Please try again.',
//         cart: CartModel.empty(),
//         subtotal: 0.0,
//         discount: 0.0,
//         shippingCost: 0.0,
//         total: 0.0,
//       ),
//     );
//     rethrow;
//   }
// }
//   Future<void> incrementProductQuantity(CartProduct product) async {
//     emit(state.copyWith(status: CartStatus.loading));
//     try {
//       final updatedCart = await repository.incrementProductQuantity(product);
//       _updateCartState(updatedCart);
//     } catch (e) {
//       emit(
//         state.copyWith(
//           status: CartStatus.error,
//           errorMessage: 'Failed to update quantity',
//         ),
//       );
//     }
//   }

//   Future<void> decrementProductQuantity(CartProduct product) async {
//     emit(state.copyWith(status: CartStatus.loading));
//     try {
//       final updatedCart = await repository.decrementProductQuantity(product);
//       _updateCartState(updatedCart);
//     } catch (e) {
//       emit(
//         state.copyWith(
//           status: CartStatus.error,
//           errorMessage: 'Failed to update quantity',
//         ),
//       );
//     }
//   }

//   Future<void> removeProduct(CartProduct product) async {
//     emit(state.copyWith(status: CartStatus.loading));
//     try {
//       final updatedCart = await repository.removeProduct(product);
//       _updateCartState(updatedCart);
//     } catch (e) {
//       emit(
//         state.copyWith(
//           status: CartStatus.error,
//           errorMessage: 'Failed to remove product',
//         ),
//       );
//     }
//   }

//   Future<void> clearCart() async {
//     emit(state.copyWith(status: CartStatus.loading));
//     try {
//       // تأكد من وجود سلة وتحتوي على معرف
//       if (state.cart != null) {
//         await repository.clearCart(state.cart!.id);
//         emit(const CartState().copyWith(status: CartStatus.cartCleared));
//       } else {
//         emit(
//           state.copyWith(
//             status: CartStatus.error,
//             errorMessage: 'No cart available to clear',
//           ),
//         );
//       }
//     } catch (e) {
//       emit(
//         state.copyWith(
//           status: CartStatus.error,
//           errorMessage: 'Failed to clear cart',
//         ),
//       );
//     }
//   }

//   void _updateCartState(CartModel cart) {
//     emit(
//       state.copyWith(
//         status: CartStatus.productUpdated,
//         cart: cart,
//         subtotal: cartUtils.calculateSubtotal(cart.products),
//         discount: cartUtils.calculateDiscount(cart.products),
//         shippingCost: cartUtils.calculateShipping(cart.products),
//         total: cartUtils.calculateTotal(
//           cart.products,
//           shippingCost: cartUtils.calculateShipping(cart.products),
//         ),
//       ),
//     );
//   }
// }
