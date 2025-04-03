import 'package:chic_lyne/features/order_confirmation/widgets/order_confirmation_body.dart';
import 'package:flutter/material.dart';

class OrderConfirmationView extends StatelessWidget {
  final String? orderId;

  const OrderConfirmationView({super.key, this.orderId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OrderConfirmationBody(orderId: orderId));
  }
}
