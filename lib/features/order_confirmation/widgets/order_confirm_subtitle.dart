import 'package:flutter/material.dart';

class OrderConfirmationSubtitle extends StatelessWidget {
  const OrderConfirmationSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'You will receive an email confirmation',
      style: TextStyle(color: Colors.grey, fontSize: 16),
      textAlign: TextAlign.center,
    );
  }
}
