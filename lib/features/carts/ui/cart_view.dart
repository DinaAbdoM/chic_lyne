// import 'package:chic_lyne/core/di/dependency_injection.dart';
// import 'package:chic_lyne/features/carts/data/models/cart_model.dart';
// import 'package:chic_lyne/features/carts/domain/usecases/add_cart.dart';
// import 'package:chic_lyne/features/carts/domain/usecases/get_all_carts.dart';
// import 'package:chic_lyne/features/carts/logic/bloc/cart_bloc.dart';
// import 'package:chic_lyne/features/carts/logic/bloc/cart_event.dart';
// import 'package:chic_lyne/features/carts/logic/bloc/cart_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class CartView extends StatelessWidget {
//   const CartView({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create:
//           (context) => CartBloc(
//             getAllCartsUseCase: getIt<GetAllCartsUseCase>(),
//             addCartUseCase: getIt<AddCartUseCase>(),
//           )..add(FetchCartsEvent()),
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Cart'),
//           actions: [
//             BlocBuilder<CartBloc, CartState>(
//               builder: (context, state) {
//                 if (state is CartLoadedState && state.carts.isNotEmpty) {
//                   return IconButton(
//                     icon: const Icon(Icons.delete),
//                     onPressed:
//                         () => context.read<CartBloc>().add(
//                           ClearCartEvent(1),
//                         ), // يجب استبدال 1 بـ cartId الفعلي
//                     tooltip: 'Clear Cart',
//                   );
//                 }
//                 return const SizedBox.shrink();
//               },
//             ),
//           ],
//         ),
//         body: BlocConsumer<CartBloc, CartState>(
//           listener: (context, state) {
//             if (state is CartErrorState) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text(state.message),
//                   backgroundColor: Colors.red,
//                 ),
//               );
//             }
//           },
//           builder: (context, state) {
//             if (state is CartLoadingState) {
//               return const Center(child: CircularProgressIndicator());
//             }

//             if (state is CartErrorState) {
//               return Center(child: Text(state.message));
//             }

//             if (state is CartLoadedState) {
//               return _buildCartContent(context, state.carts);
//             }

//             return const Center(child: Text('Unknown state'));
//           },
//         ),
//       ),
//     );
//   }

//   Widget _buildCartContent(BuildContext context, List<CartModel> carts) {
//     if (carts.isEmpty) {
//       return _buildEmptyCartView(context);
//     } // نعرض أول عربة فقط كمثال (ممكن اعديلها لعرض كل العربات)
//     // final cart = carts.first;

//     return Column(
//       children: [
//         Expanded(
//           child: ListView.builder(
//             itemCount: carts.length ?? 0,
//             itemBuilder: (context, index) {
//               final product = carts[index];
//               return _buildProductItem(
//                 context,
//                 product as Products,

//                 carts.isNotEmpty ? carts[index].id : 1,
//               ); // يجب استبدال 1 بـ cartId الفعلي (carts[index].id!)
//             },
//           ),
//         ),
//         _buildCartSummary(context, carts.first as Carts),
//       ],
//     );
//   }

//   Widget _buildProductItem(BuildContext context, Products product, int cartId) {
//     return Card(
//       margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//       child: ListTile(
//         leading:
//             product.thumbnail?.isNotEmpty == true
//                 ? Image.network(product.thumbnail!, width: 50, height: 50)
//                 : const Icon(Icons.shopping_bag),
//         title: Text(product.title ?? 'No title'),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('\$${product.price?.toStringAsFixed(2) ?? '0.00'}'),
//             if (product.discountPercentage != null &&
//                 product.discountPercentage! > 0)
//               Text(
//                 'Save ${product.discountPercentage}%',
//                 style: const TextStyle(color: Colors.green),
//               ),
//           ],
//         ),
//         trailing: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             IconButton(
//               icon: const Icon(Icons.remove),
//               onPressed:
//                   () => context.read<CartBloc>().add(
//                     DecrementProductQuantityEvent(cartId, product.id!),
//                   ),
//             ),
//             Text('${product.quantity}'),
//             IconButton(
//               icon: const Icon(Icons.add),
//               onPressed:
//                   () => context.read<CartBloc>().add(
//                     IncrementProductQuantityEvent(cartId, product.id!),
//                   ),
//             ),
//             IconButton(
//               icon: const Icon(Icons.delete_outline),
//               onPressed:
//                   () => context.read<CartBloc>().add(
//                     RemoveProductFromCartEvent(cartId, product.id!),
//                   ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildEmptyCartView(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Icon(
//             Icons.shopping_cart_outlined,
//             size: 64,
//             color: Colors.grey,
//           ),
//           const SizedBox(height: 16),
//           const Text('Your cart is empty'),
//           const SizedBox(height: 16),
//           ElevatedButton(
//             onPressed: () => context.read<CartBloc>().add(FetchCartsEvent()),
//             child: const Text('Browse Products'),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildCartSummary(BuildContext context, Carts cart) {
//     final subtotal = cart.total ?? 0;
//     final discount =
//         (cart.discountedTotal != null && cart.total != null)
//             ? cart.total! - cart.discountedTotal!
//             : 0;
//     const shippingCost = 5.0; // يمكن حسابها بشكل ديناميكي
//     final total = subtotal - discount + shippingCost;

//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Theme.of(context).cardColor,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 1,
//             blurRadius: 3,
//             offset: const Offset(0, -2),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           _buildSummaryRow('Subtotal', subtotal),
//           const SizedBox(height: 8),
//           _buildSummaryRow('Discount', -discount as double),
//           const SizedBox(height: 8),
//           _buildSummaryRow('Shipping', shippingCost),
//           const Divider(height: 24),
//           _buildSummaryRow('Total', total, isTotal: true),
//           const SizedBox(height: 16),
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//               onPressed: () => _checkout(context, cart.id!),
//               child: const Text('Proceed to Checkout'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSummaryRow(String label, double amount, {bool isTotal = false}) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: isTotal ? 16 : 14,
//             fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
//           ),
//         ),
//         Text(
//           '\$${amount.toStringAsFixed(2)}',
//           style: TextStyle(
//             fontSize: isTotal ? 18 : 14,
//             fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
//             color: amount < 0 ? Colors.green : null,
//           ),
//         ),
//       ],
//     );
//   }

//   void _checkout(BuildContext context, int cartId) {
//     // يمكن إضافة منطق الدفع هنا
//     ScaffoldMessenger.of(
//       context,
//     ).showSnackBar(const SnackBar(content: Text('Checkout initiated')));
//   }
// }
import 'package:chic_lyne/core/di/dependency_injection.dart';
import 'package:chic_lyne/features/carts/domain/entities/cart.dart';
import 'package:chic_lyne/features/carts/logic/bloc/cart_bloc.dart';
import 'package:chic_lyne/features/carts/ui/widgets/cart_item_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CartBloc>()..add(GetAllCartsEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          actions: [
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state is AllCartsLoaded && state.carts.isNotEmpty) {
                  return IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => context.read<CartBloc>().add(
                      ClearCartEvent(state.carts.first.id!), // Use actual cart ID
                    ),
                    tooltip: 'Clear Cart',
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
        body: BlocConsumer<CartBloc, CartState>(
          listener: (context, state) {
            if (state is CartError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is CartLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is CartError) {
              return Center(child: Text(state.message));
            }

            if (state is AllCartsLoaded) {
              return _buildCartContent(context, state.carts);
            }

            return const Center(child: Text('Unknown state'));
          },
        ),
      ),
    );
  }

  Widget _buildCartContent(BuildContext context, List<Cart> carts) {
    if (carts.isEmpty) {
      return _buildEmptyCartView(context);
    }

    // Show all carts and their products
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: carts.length,
            itemBuilder: (context, cartIndex) {
              final cart = carts[cartIndex];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (carts.length > 1) // Show cart header only if multiple carts
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Cart ${cartIndex + 1}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ...cart.products!.map((product) => CartItemTile(
                    product: product,
                    cartId: cart.id!,
                    onIncrease: () => context.read<CartBloc>().add(
                      IncrementProductQuantityEvent(cart.id!, product.id!),
                    ),
                    onDecrease: () => context.read<CartBloc>().add(
                      DecrementProductQuantityEvent(cart.id!, product.id!),
                    ),
                    onRemove: () => context.read<CartBloc>().add(
                      RemoveProductFromCartEvent(cart.id!, product.id!),
                    ),
                  )).toList(),
                ],
              );
            },
          ),
        ),
        _buildCartSummary(context, carts), // Updated to handle multiple carts
      ],
    );
  }

  Widget _buildEmptyCartView(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.shopping_cart_outlined, size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          const Text('Your cart is empty'),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => Navigator.pop(context), // Or navigate to products
            child: const Text('Browse Products'),
          ),
        ],
      ),
    );
  }

  Widget _buildCartSummary(BuildContext context, List<Cart> carts) {
    // Calculate totals across all carts
    double subtotal = carts.fold(0, (sum, cart) => sum + (cart.total ?? 0));
    double discount = carts.fold(0, (sum, cart) => 
      sum + ((cart.discountedTotal != null && cart.total != null)
        ? (cart.total! - cart.discountedTotal!)
        : 0));
    const shippingCost = 5.0; // Could be calculated per cart
    double total = subtotal - discount + shippingCost;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildSummaryRow('Subtotal', subtotal),
          const SizedBox(height: 8),
          _buildSummaryRow('Discount', -discount),
          const SizedBox(height: 8),
          _buildSummaryRow('Shipping', shippingCost),
          const Divider(height: 24),
          _buildSummaryRow('Total', total, isTotal: true),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _checkout(context, carts.map((c) => c.id!).toList()),
              child: const Text('Proceed to Checkout'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, double amount, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          '\$${amount.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: isTotal ? 18 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: amount < 0 ? Colors.green : null,
          ),
        ),
      ],
    );
  }

  void _checkout(BuildContext context, List<int> cartIds) {
    // Handle checkout for all carts
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Checkout initiated for selected carts')),
    );
    // You might want to add logic to process each cart
  }
}