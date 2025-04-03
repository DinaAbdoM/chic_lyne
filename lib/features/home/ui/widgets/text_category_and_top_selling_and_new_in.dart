import 'package:flutter/material.dart';

class TextCategoryAndTopSellingAndNewIn extends StatelessWidget {
 final String text;
  final TextStyle style;
  final void Function()? onPressed;
  final String textButton;
  final TextStyle styleTextButton;

  const TextCategoryAndTopSellingAndNewIn({
    super.key,
    required this.text,
    required this.style,
    this.onPressed,
    required this.textButton,
    required this.styleTextButton,
  });

  @override
  Widget build(BuildContext context) {
   return Padding(
    padding: const EdgeInsets.all(8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: style),
        TextButton(
          onPressed: onPressed,
          child: Text(textButton, style: styleTextButton),
        ),
      ],
    ),
  );
  }
}

