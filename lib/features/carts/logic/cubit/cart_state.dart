// part of 'cart_cubit.dart';

// enum CartStatus {
//   initial,
//   loading,
//   loaded,
//   error,
//   productUpdated,
//   cartCleared,
//   empty
// }

// class CartState extends Equatable {
//   final CartStatus status;
//   final CartModel? cart;
//   final String? errorMessage;
//   final double subtotal;
//   final double discount;
//   final double shippingCost;
//   final double total;

//   const CartState({
//     this.status = CartStatus.initial,
//     this.cart,
//     this.errorMessage,
//     this.subtotal = 0.0,
//     this.discount = 0.0,
//     this.shippingCost = 0.0,
//     this.total = 0.0,
//   });

//   CartState copyWith({
//     CartStatus? status,
//     CartModel? cart,
//     String? errorMessage,
//     double? subtotal,
//     double? discount,
//     double? shippingCost,
//     double? total,
//   }) {
//     return CartState(
//       status: status ?? this.status,
//       cart: cart ?? this.cart,
//       errorMessage: errorMessage ?? this.errorMessage,
//       subtotal: subtotal ?? this.subtotal,
//       discount: discount ?? this.discount,
//       shippingCost: shippingCost ?? this.shippingCost,
//       total: total ?? this.total,
//     );
//   }

//   @override
//   List<Object?> get props => [
//         status,
//         cart,
//         errorMessage,
//         subtotal,
//         discount,
//         shippingCost,
//         total,
//       ];
// }