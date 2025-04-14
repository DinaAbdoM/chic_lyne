import 'package:chic_lyne/core/components/bottom_sheets/responsive_bottom_sheet_layout.dart';
import 'package:chic_lyne/core/cubits/filter/filter_cubit.dart';
import 'package:chic_lyne/core/cubits/filter/filter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorFilterSheet extends StatelessWidget {
  final List<Map<String, dynamic>> colorOptions;

  const ColorFilterSheet({super.key, required this.colorOptions});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        final selectedColor =
            state is FilterLoaded ? state.selectedFilters['color'] : null;

        return ResponsiveBottomSheetLayout(
          title: 'Color',
          clearAction: () {
            context.read<FilterCubit>().clearSelectedItem('color');
            Navigator.pop(context);
          },
          body: GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: colorOptions.length,
            itemBuilder: (context, index) {
              final colorData = colorOptions[index];
              final colorId = colorData['id'] as String;
              final colorValue = colorData['value'] as Color;
              final colorName = colorData['name'] as String;
              final isSelected = selectedColor == colorId;

              return GestureDetector(
                onTap: () {
                  context.read<FilterCubit>().updateSelectedItem(
                    'color',
                    colorId,
                  );
                  Navigator.pop(context);
                },
                child: Column(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: colorValue,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color:
                              isSelected
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey.shade300,
                          width: isSelected ? 3 : 1,
                        ),
                      ),
                      child:
                          isSelected
                              ? Icon(
                                Icons.check,
                                color:
                                    colorValue.computeLuminance() > 0.5
                                        ? Colors.black
                                        : Colors.white,
                              )
                              : null,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      colorName,
                      style: TextStyle(
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
