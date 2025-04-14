import 'package:flutter/material.dart';

class ResponsiveBottomSheetLayout extends StatelessWidget {
  final String title;
  final Widget body;
  final VoidCallback clearAction;
  final List<Widget>? actions;
  
  const ResponsiveBottomSheetLayout({
    super.key,
    required this.title,
    required this.body,
    required this.clearAction,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Drag handle
        Center(
          child: Container(
            margin: const EdgeInsets.only(top: 8),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
        
        // Header
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: clearAction,
                child: const Text(
                  'Clear',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close, size: 24),
              ),
            ],
          ),
        ),
        
        const Divider(height: 1),
        
        // Body
        Expanded(child: body),
        
        // Optional actions
        if (actions != null && actions!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: actions!,
            ),
          ),
      ],
    );
  }
}