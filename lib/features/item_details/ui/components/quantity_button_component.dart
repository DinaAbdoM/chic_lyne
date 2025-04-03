import 'package:flutter/material.dart';

class QuantityButtonComponent extends StatelessWidget {
  final IconData icon;
  final double size;
  final VoidCallback onPressed;

  const QuantityButtonComponent({
    super.key,
    required this.icon,
    required this.size,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.deepPurple[400],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        icon: Icon(icon, size: size * 0.6, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }
}
