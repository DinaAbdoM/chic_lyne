import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchTextField extends StatelessWidget {
  final String? hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final int? maxLines;
  final int? maxLength;
  final bool enabled;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final TextAlign textAlign;
  final Color? cursorColor;
  final Radius? cursorRadius;
  final TextStyle? style;
  final InputDecoration? decoration;

  const SearchTextField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.onSubmitted,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.maxLines = 1,
    this.maxLength,
    this.enabled = true,
    this.readOnly = false,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.textAlign = TextAlign.start,
    this.cursorColor,
    this.cursorRadius,
    this.style,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        final fontSize = screenWidth * 0.04;
        final iconSize = screenWidth * 0.06;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            onChanged: onChanged,
            onSubmitted: onSubmitted,
            obscureText: obscureText,
            maxLines: maxLines,
            maxLength: maxLength,
            enabled: enabled,
            readOnly: readOnly,
            inputFormatters: inputFormatters,
            textCapitalization: textCapitalization,
            textAlign: textAlign,
            cursorColor: cursorColor,
            cursorRadius: cursorRadius,
            style: style ?? TextStyle(fontSize: fontSize),
            decoration: decoration ??
                InputDecoration(
                  fillColor: Colors.grey[300],
                  filled: true,
                  contentPadding: const EdgeInsets.all(0),
                  prefixIcon: Icon(prefixIcon ?? Icons.search, size: iconSize),
                  suffixIcon: suffixIcon != null ? Icon(suffixIcon, size: iconSize) : null,
                  hintText: hintText ?? 'Search',
                  hintStyle: TextStyle(fontSize: fontSize),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  ),
                ),
          ),
        );
      },
    );
  }
}