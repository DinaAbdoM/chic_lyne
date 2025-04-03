import 'package:flutter/material.dart';
import 'circular_button_component.dart';

class AppBarComponent extends StatelessWidget {
  final double padding;

  const AppBarComponent({
    super.key,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircularButtonComponent(
            icon: Icons.arrow_back_ios_new,
            iconSize: 18,
            onPressed: () => Navigator.pop(context),
          ),
          CircularButtonComponent(
            icon: Icons.favorite_border,
            iconSize: 18,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}