// import 'package:chic_lyne/features/carts/data/models/cart_model.dart';
// import 'package:flutter/material.dart';

// class CartItemTile extends StatelessWidget {
//   final CartModel item;
//   final VoidCallback onIncrease;
//   final VoidCallback onDecrease;
//   final VoidCallback onRemove;

//   const CartItemTile({
//     super.key,
//     required this.item,
//     required this.onIncrease,
//     required this.onDecrease,
//     required this.onRemove,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: Image.network(
//         item.carts.
//       ), // Assume image URL exists
//       title: Text(item.products.first.title),
//       // subtitle: Text('Size: M, Color: ${item.color}'),
//       trailing: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           IconButton(icon: Icon(Icons.remove), onPressed: onDecrease),
//           Text('${item.totalQuantity}'),
//           IconButton(icon: Icon(Icons.add), onPressed: onIncrease),
//           Text('\$${item.products.first.price.toStringAsFixed(2)}'),
//         ],
//       ),
//     );
//   }
// }
import 'package:chic_lyne/core/data/models/cart/cart_response.dart';
import 'package:chic_lyne/features/carts/domain/entities/cart.dart';
import 'package:chic_lyne/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';

class CartItemTile extends StatelessWidget {
  final CartItemModel
  item; // Changed from CartModel to Products since we're displaying individual products
  final int cartId;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onRemove;

  const CartItemTile({
    super.key,
    required this.item,
    required this.cartId,
    required this.onIncrease,
    required this.onDecrease,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        leading:
            item.product?.thumbnail?.isNotEmpty == true
                ? Image.network(item.product!.thumbnail!, width: 50, height: 50)
                : const Icon(Icons.shopping_bag),
        title: Text(item.product?.title ?? 'No title'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('\$${item.price.toStringAsFixed(2) ?? '0.00'}'),
            if (item.discountPercentage > 0)
              Text(
                'Save ${item.discountPercentage}%',
                style: const TextStyle(color: Colors.green),
              ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(icon: const Icon(Icons.remove), onPressed: onDecrease),
            Text('${item.quantity}'),
            IconButton(icon: const Icon(Icons.add), onPressed: onIncrease),
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: onRemove,
            ),
          ],
        ),
      ),
    );
  }
}
