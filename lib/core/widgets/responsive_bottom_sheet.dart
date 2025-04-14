import 'package:flutter/material.dart';

/// A responsive, reusable bottom sheet component that follows clean code principles.
/// This implementation includes draggable behavior, responsive height, 
/// and customizable content.
class ResponsiveBottomSheet extends StatefulWidget {
  final String title;
  final Widget content;
  final List<Widget>? actions;
  final double initialChildSize;
  final double minChildSize;
  final double maxChildSize;
  final bool isDismissible;
  final bool enableDrag;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;

  const ResponsiveBottomSheet({
    super.key,
    required this.title,
    required this.content,
    this.actions,
    this.initialChildSize = 0.5,
    this.minChildSize = 0.25,
    this.maxChildSize = 0.9,
    this.isDismissible = true,
    this.enableDrag = true,
    this.backgroundColor,
    this.borderRadius,
  });

  /// Static method to show the bottom sheet
  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required Widget content,
    List<Widget>? actions,
    double initialChildSize = 0.5,
    double minChildSize = 0.25,
    double maxChildSize = 0.9,
    bool isDismissible = true,
    bool enableDrag = true,
    Color? backgroundColor,
    BorderRadius? borderRadius,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      backgroundColor: Colors.transparent,
      builder: (context) => ResponsiveBottomSheet(
        title: title,
        content: content,
        actions: actions,
        initialChildSize: initialChildSize,
        minChildSize: minChildSize,
        maxChildSize: maxChildSize,
        isDismissible: isDismissible,
        enableDrag: enableDrag,
        backgroundColor: backgroundColor,
        borderRadius: borderRadius,
      ),
    );
  }

  @override
  State<ResponsiveBottomSheet> createState() => _ResponsiveBottomSheetState();
}

class _ResponsiveBottomSheetState extends State<ResponsiveBottomSheet> {
  @override
  Widget build(BuildContext context) {
    // Get the media query to handle responsive sizing
    final mediaQuery = MediaQuery.of(context);
    
    return DraggableScrollableSheet(
      initialChildSize: widget.initialChildSize,
      minChildSize: widget.minChildSize,
      maxChildSize: widget.maxChildSize,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
            borderRadius: widget.borderRadius ?? const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildDragHandle(),
              _buildHeader(context),
              Expanded(
                child: _buildContent(scrollController),
              ),
              if (widget.actions != null && widget.actions!.isNotEmpty)
                _buildActions(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDragHandle() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          width: 40,
          height: 4,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              widget.title,
              style: Theme.of(context).textTheme.titleLarge,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (widget.isDismissible)
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
              splashRadius: 24,
            ),
        ],
      ),
    );
  }

  Widget _buildContent(ScrollController scrollController) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      child: SingleChildScrollView(
        controller: scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        child: widget.content,
      ),
    );
  }

  Widget _buildActions() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600 || widget.actions!.length > 2) {
              // For small screens or many actions, stack buttons vertically
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: widget.actions!.map((action) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: action,
                  );
                }).toList(),
              );
            } else {
              // For larger screens with two or fewer actions, place them side by side
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: widget.actions!.map((action) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: action,
                  );
                }).toList(),
              );
            }
          },
        ),
      ),
    );
  }
}

// Example usage:
void showExampleBottomSheet(BuildContext context) {
  ResponsiveBottomSheet.show(
    context: context,
    title: 'Bottom Sheet Title',
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'This is a responsive bottom sheet with clean, refactored code.',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 16),
        // Add your custom content here
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(child: Text('${index + 1}')),
              title: Text('Item ${index + 1}'),
              subtitle: Text('Description for item ${index + 1}'),
              onTap: () {
                Navigator.pop(context, index);
              },
            );
          },
        ),
      ],
    ),
    actions: [
      OutlinedButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Cancel'),
      ),
      ElevatedButton(
        onPressed: () {
          // Handle confirmation action
          Navigator.pop(context, true);
        },
        child: const Text('Confirm'),
      ),
    ],
  );
}