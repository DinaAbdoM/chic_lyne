import 'package:flutter/material.dart';

class OrderSuccessTitle extends StatelessWidget {
  const OrderSuccessTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Order Placed\n Successfully',
      style: TextStyle(
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.w700,
      ),
      textAlign: TextAlign.center,
    );
  }
}
