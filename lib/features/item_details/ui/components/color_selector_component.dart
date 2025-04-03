import 'package:chic_lyne/core/widgets/generic_bottom_sheet.dart';
import 'package:chic_lyne/features/item_details/logic/cubits/color_cubit.dart';
import 'package:chic_lyne/features/item_details/ui/components/selector_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorSelectorComponent extends StatefulWidget {
  final double textSize;
  final bool isSmallScreen;
  final List<Color> colors;
  final Function(Color) onColorSelected;
  final Color? initialColor;
  final double? avatarRadius;
  final double? iconSize;
  final Color? iconColor;
  final Color? labelColor;
  

  const ColorSelectorComponent({
    super.key,
    required this.textSize,
    required this.isSmallScreen,
    required this.colors,
    required this.onColorSelected,
    this.initialColor,
    this.avatarRadius,
    this.iconSize,
    this.iconColor,
    this.labelColor,
  });

  @override
  _ColorSelectorComponentState createState() => _ColorSelectorComponentState();
}

class _ColorSelectorComponentState extends State<ColorSelectorComponent> {
  Color? _selectedColor;

  @override
  void initState() {
    super.initState();
    _selectedColor = widget.colors.first;
  }

  void _showColorBottomSheet(BuildContext context) {
    // showModalBottomSheet(
    //   context: context,
    //   builder: (context) {
    //     return Column(
    //       mainAxisSize: MainAxisSize.min,
    //       children: widget.colors
    //           .map((color) => ListTile(
    //                 leading: CircleAvatar(backgroundColor: color),
    //                 onTap: () {
    //                   setState(() {
    //                     _selectedColor = color;
    //                   });
    //                   widget.onColorSelected(color);
    //                   Navigator.pop(context);
    //                 },
    //               ))
    //           .toList(),
    //     );
    //   },
    // );
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BlocProvider(
          create: (context) => ColorCubit(),
          child: BlocBuilder<ColorCubit, Color?>(
            builder: (context, state) {
              return GenericBottomSheet<Color>(
                items: widget.colors,
                selectedItem: state,
                onItemSelected: (color) {
                  context.read<ColorCubit>().updateSelectedColor(color);
                  setState(() {
                    _selectedColor = color;
                  });
                  widget.onColorSelected(color);
                   Navigator.pop(context);
                },
                 title: "Select Color",
                itemBuilder: (color) => CircleAvatar(backgroundColor: color),
                itemLabelBuilder: (color) => getColorName(color), // استخدام دالة للحصول على اسم اللون
                showColorPreview: true, // عرض معاينة اللون
              );
            },
          ),
        );
      },
    );
  }

  // دالة للحصول على اسم اللون (يمكنك استبدالها بمنطقك الخاص)
  String getColorName(Color color) {
    if (color == Colors.red) return "Red";
    if (color == Colors.blue) return "Blue";
    if (color == Colors.green) return "Green";
    if (color == Colors.yellow) return "Yellow";
    if (color == Colors.black) return "Black";
    if (color == Colors.orange) return "Orange";
   
    return "Unknown";
  }
  @override
  Widget build(BuildContext context) {
    return SelectorComponent(
      label: "Color",
      textSize: widget.textSize,
      labelColor: widget.labelColor,
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: _selectedColor ?? widget.colors.first,
            radius:
                widget.avatarRadius ?? (widget.isSmallScreen ? 8.sp : 10.sp),
          ),
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_down),
            onPressed: () => _showColorBottomSheet(context),
            padding: EdgeInsets.zero,
            iconSize: widget.iconSize ?? (widget.isSmallScreen ? 18.sp : 24.sp),
            color: widget.iconColor,
          ),
        ],
      ),
    );
  }
}
