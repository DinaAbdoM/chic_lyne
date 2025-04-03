import 'package:flutter/material.dart';

class SeeOrderDetailsButton extends StatelessWidget {
  final String? orderId;

  const SeeOrderDetailsButton({super.key, required this.orderId});

  void _onOrderDetailsPressed(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
      child: ElevatedButton(
        onPressed: () => _onOrderDetailsPressed(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF8A56F8),
          foregroundColor: Colors.white,

          minimumSize: Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: const Text(
          'See Order Details',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
