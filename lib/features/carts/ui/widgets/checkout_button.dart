import 'package:flutter/material.dart';

class CheckoutButton extends StatelessWidget {
  final double total;
  final VoidCallback onCheckout;

  const CheckoutButton({
    Key? key,
    required this.total,
    required this.onCheckout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
        minimumSize: Size(double.infinity, 50),
      ),
      onPressed: onCheckout,
      child: Text('Checkout - \$${total.toStringAsFixed(2)}'),
    );
  }
}
